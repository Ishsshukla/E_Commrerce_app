import 'package:bts_assignment/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onTap,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isFavorite; // Initialize isLiked with isFavorite
  }

  void toggleFavorite() {
    setState(() {
      isLiked = !isLiked; // Toggle the isLiked state
    });
    widget.onFavoriteToggle(); // Call the callback
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.5; // Adjust the width as needed

    return GestureDetector(
      onTap: widget.onTap, // Handle card tap
      child: SizedBox(
        width: cardWidth,
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.grey[100],
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      height: cardWidth, // Adjust the height as needed
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: HeadingH3, // Use custom font style
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.product.category,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: toggleFavorite, // Handle favorite toggle
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
