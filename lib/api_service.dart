import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart'; // Required for content-type

class ApiService {
  static Future<Map<String, dynamic>> uploadPhotos(List<File> images) async {
    var uri = Uri.parse('https://zwhpq21f-5002.inc1.devtunnels.ms/predict'); // Update with your Flask API's URL

    var request = http.MultipartRequest('POST', uri);

    // Add each image to the request
    for (File image in images) {
      var mimeType = lookupMimeType(image.path);
      var fileStream = http.ByteStream(image.openRead());
      fileStream.cast();
      var fileLength = await image.length();

      // Create a multipart file for each image
      var multipartFile = http.MultipartFile(
        'files',  // This key matches the Flask API's expected parameter name
        fileStream,
        fileLength,
        filename: basename(image.path),
        contentType: MediaType.parse(mimeType!),
      );

      request.files.add(multipartFile);
    }

    // Send the request and get the response
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      throw Exception("Failed to upload photos, Status Code: ${response.statusCode}");
    }
  }
}
