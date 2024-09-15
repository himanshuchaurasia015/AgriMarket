import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> createProduct(
    String name,
    String type,
    String season,
    String fertilizer,
    String pesticides,
    String phone,
    String duration,
    String quality,
    String minprice,
    String maxprice,
    String baseprice
    ) async {
  final url = Uri.parse('http://localhost:5000/api/products/create');

  // Creating JSON data to send in the request body
  var body = jsonEncode({
    'name': name,
    'type': type,
    'season': season,
    'fertilizer': fertilizer,
    'pesticides': pesticides,
    'phone': phone,
    'duration': duration,
    'quality': quality,
    'minprice': minprice,
    'maxprice': maxprice,
    'baseprice': baseprice
  });

  // Sending a POST request with JSON data
  var response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  if (response.statusCode == 201) {
    print('Product created successfully');
  } else {
    print('Failed to create product: ${response.statusCode}');
  }
  return response;
}
