import 'package:bts_assignment/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imageUrl,
                width: screenWidth,
                height: screenHeight * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                product.title,
                style: TextStyle(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, color: Colors.green),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Category: ${product.category}',
                style:
                    TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
