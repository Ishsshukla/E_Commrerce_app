import 'package:bts_assignment/services/product.detail.service.dart';
import 'package:flutter/material.dart';
// import 'product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductServicedetails _productService = ProductServicedetails();
  Map<String, dynamic>? product;
  bool isLoading = false;

  Future<void> loadProduct(num productId) async {
    isLoading = true;
    notifyListeners();

    try {
      product = await _productService.fetchProductData(productId);
    } catch (e) {
      debugPrint('Error loading product: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
