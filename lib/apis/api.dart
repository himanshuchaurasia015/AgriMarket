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
  final url = Uri.parse('http://10.0.2.2:5000/api/products/create');

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

Future<void> getFarmerProducts(String token) async {
  final url = Uri.parse('http://10.0.2.2:5000/api/products/my-products');

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
  final url = Uri.parse('http://10.0.2.2:5000/api/products/deactivate/$productId');

  var response = await http.put(url, headers: {
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    print('Product deactivated successfully');
  } else {
    print('Failed to deactivate product: ${response.statusCode}');
  }
}

Future<List<Map<String, dynamic>>> getActiveProducts() async {
  final url = Uri.parse('http://10.0.2.2:5000/api/products/active');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Active products: $data');
    return List<Map<String, dynamic>>.from(data);
  } else {
    print('Failed to fetch active products: ${response.statusCode}');
    return []; // Return an empty list on failure
  }
}