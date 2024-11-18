
import 'package:bts_assignment/providers/product_provider.dart';
import 'package:bts_assignment/screens/details/product_details_screen.dart';
import 'package:bts_assignment/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (productProvider.products.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          return GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.7,
  ),
  itemCount: productProvider.products.length,
  itemBuilder: (context, index) {
    final product = productProvider.products[index];
    return ProductCard(
      product: product,
      isFavorite: false, // Replace with logic to check if the product is a favorite
      onFavoriteToggle: () {
        
        print('${product.title} favorite toggled!');
      },
      onTap: () {
        // Navigate to product details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
    );
  },
);

        
        },
      ),
    );
  }
}
