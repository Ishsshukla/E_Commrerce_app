import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductServicedetails {
  Future<Map<String, dynamic>> fetchProductData(num productId) async {
    final url = 'https://dummyjson.com/products/$productId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Error fetching product data: $e');
    }
  }
}
