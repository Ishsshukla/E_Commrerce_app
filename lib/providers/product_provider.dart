// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/product.dart';
// import '../services/db_helper.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];
//   bool _isLoading = false;

//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;

//   final DBHelper _dbHelper = DBHelper();

//   Future<void> fetchProductsFromApi() async {
//     _isLoading = true;
//     notifyListeners();

//     final url = 'https://dummyjson.com/products/category/womens-shoes';

//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['products'] as List;
//         final products = data.map((json) => Product.fromJson(json)).toList();

//         // Save products in SQLite
//         await _dbHelper.insertProducts(products);

//         // Update the provider state
//         _products = products;
//         _isLoading = false;
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       _isLoading = false;
//       notifyListeners();
//       rethrow;
//     }
//   }

//   Future<void> loadProductsFromDb() async {
//     _products = await _dbHelper.getProducts();
//     notifyListeners();
//   }
// }
