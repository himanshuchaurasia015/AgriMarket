import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> createProduct(
    String name,
    String type,
    String season,
    String fertilizer,
    String pesticides,
    String phone,
    String duration,
    String imagePath,
    String token,
    String quality,
    String minprice,
    String maxprice,
    String baseprice
    ) async {
  final url = Uri.parse('http://localhost:5000/api/products/create');

  var request = http.MultipartRequest('POST', url)
    ..fields['name'] = name
    ..fields['type'] = type
    ..fields['season'] = season
    ..fields['fertilizer'] = fertilizer
    ..fields['pesticides'] = pesticides
    ..fields['phone'] = phone
    ..fields['duration'] = duration
    ..fields['quality'] = quality
    ..fields['minprice'] = minprice
    ..fields['maxprice'] = maxprice
    ..fields['baseprice'] = baseprice
    ..files.add(await http.MultipartFile.fromPath('images', imagePath));

  var response = await request.send();

  if (response.statusCode == 201) {
    print('Product created successfully');
  } else {
    print('Failed to create product: ${response.statusCode}');
  }
}

Future<void> getFarmerProducts(String token) async {
  final url = Uri.parse('http://localhost:5000/api/products/my-products');

  var response = await http.get(url, headers: {
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Farmer products: $data');
  } else {
    print('Failed to fetch farmer products: ${response.statusCode}');
  }
}



Future<void> deactivateProduct(String productId, String token) async {
  final url = Uri.parse('http://localhost:5000/api/products/deactivate/$productId');

  var response = await http.put(url, headers: {
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    print('Product deactivated successfully');
  } else {
    print('Failed to deactivate product: ${response.statusCode}');
  }
}

Future<void> getActiveProducts() async {
  final url = Uri.parse('http://localhost:5000/api/products/active');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Active products: $data');
  } else {
    print('Failed to fetch active products: ${response.statusCode}');
  }
}

