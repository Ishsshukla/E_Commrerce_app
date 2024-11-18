// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ApiService {
//   final String baseUrl = 'https://dummyjson.com';

//   Future<List<Product>> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/products/category/womens-shoes'));

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData.map((item) => Product.fromJson(item)).toList();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }
