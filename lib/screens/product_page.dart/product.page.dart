import 'dart:convert';
import 'package:bts_assignment/constants/app_fonts.dart';
import 'package:bts_assignment/widgets/appbar.dart';
import 'package:bts_assignment/widgets/future.icon.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsScreen2 extends StatefulWidget {
  final num productId;

  const ProductDetailsScreen2({Key? key, required this.productId})
      : super(key: key);

  @override
  _ProductDetailsScreen2State createState() => _ProductDetailsScreen2State();
}

class _ProductDetailsScreen2State extends State<ProductDetailsScreen2> {
  Map<String, dynamic>? product;
  int _currentImageIndex = 0;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    final url = 'https://dummyjson.com/products/${widget.productId}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          product = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print('Error fetching product data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: const CustomAppBar2(),
      body: product == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Carousel
                        Stack(
                          children: [
                            CarouselSlider(
                              items: (product!['images'] as List<dynamic>)
                                  .map((image) {
                                return Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: screenHeight * 0.4,
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentImageIndex = index;
                                  });
                                },
                              ),
                            ),
                            // Dots Indicator
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  (product!['images'] as List<dynamic>).length,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    width: _currentImageIndex == index
                                        ? 10.0
                                        : 6.0,
                                    height: _currentImageIndex == index
                                        ? 10.0
                                        : 6.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentImageIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var size in ['4.5Y', '5.5Y', '6.5Y'])
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedSize = size;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: Chip(
                                    backgroundColor: _selectedSize == size
                                        ? Colors.black
                                        : Colors.white,
                                    label: Text(
                                      size,
                                      style: TextStyle(
                                        color: _selectedSize == size
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Product Title
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(product!['category'],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                              Center(
                                  child: Text(product!['title'],
                                      style: HeadingH2)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    product!['description'],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              // Features
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[100]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FeatureIcon(
                                        icon: Icons.star,
                                        label: "${product!['rating']} / 5",
                                      ),
                                      Container(
                                        height: 40,
                                        child: VerticalDivider(
                                          color: Colors.grey[300],
                                          thickness: 1,
                                        ),
                                      ),
                                      const FeatureIcon(
                                        icon: Icons.favorite,
                                        label: "Comfort",
                                      ),
                                      Container(
                                        height: 40,
                                        child: VerticalDivider(
                                          color: Colors.grey[300],
                                          thickness: 1,
                                        ),
                                      ),
                                      const FeatureIcon(
                                        icon: Icons.security,
                                        label: "Durable",
                                      ),
                                      Container(
                                        height: 40,
                                        child: VerticalDivider(
                                          color: Colors.grey[300],
                                          thickness: 1,
                                        ),
                                      ),
                                      const FeatureIcon(
                                        icon: Icons.adb,
                                        label: "Adaptive",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: screenWidth * 0.33),
                                  Text(
                                    "show more",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.grey[800]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Add to Cart pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth * 0.5, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "Add to Cart              \$${product!['price']}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}


