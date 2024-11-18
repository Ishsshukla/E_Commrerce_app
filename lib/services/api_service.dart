
import 'dart:convert';
import 'package:bts_assignment/screens/product_page.dart/product.page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  final String baseUrl = 'https://dummyjson.com';
  Future<List<Product>> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/category/womens-shoes'));
    if (response.statusCode == 200) {
      print(response.body); // Log the response
      final List<dynamic> data = json.decode(response.body)['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print('Error fetching products: $e');
    throw Exception('Error: $e');
  }
}
}


