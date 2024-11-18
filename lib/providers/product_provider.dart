

import 'package:bts_assignment/services/api_service.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
// import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  
   Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners(); // Notify the UI to show the loader
    try {
      final products = await ProductService().fetchProducts();
      _products = products;
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify the UI to hide the loader
    }
  }
}
