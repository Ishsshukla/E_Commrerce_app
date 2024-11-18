// import 'package:bts_assignment/providers/favourites_provider.dart';
// import 'package:bts_assignment/providers/product_provider.dart';
// import 'package:bts_assignment/screens/favourites/favorites_screen.dart';
// import 'package:bts_assignment/widgets/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import '../providers/product_provider.dart';
// // import '../widgets/product_card.dart';
// // import 'favorites_screen.dart';

// class ProductListingScreen extends StatefulWidget {
//   const ProductListingScreen({Key? key}) : super(key: key);

//   @override
//   State<ProductListingScreen> createState() => _ProductListingScreenState();
// }

// class _ProductListingScreenState extends State<ProductListingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final productProvider = Provider.of<ProductProvider>(context, listen: false);

//     productProvider.loadProductsFromDb().then((_) {
//       if (productProvider.products.isEmpty) {
//         productProvider.fetchProductsFromApi();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Listing'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: productProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : GridView.builder(
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 3 / 4,
//               ),
//               itemCount: productProvider.products.length,
//               itemBuilder: (context, index) {
//                 final product = productProvider.products[index];
//                 final favoritesProvider = Provider.of<FavoritesProvider>(context);
//                 final isFavorite = favoritesProvider.favorites.any((p) => p.id == product.id);

//                 return ProductCard(
//                   id: product.id,
//                   title: product.title,
//                   description: product.description,
//                   price: product.price,
//                   imageUrl: product.imageUrl,
//                   category: product.category,
//                 ) as Widget;
//               },
//             ),
//     );
//   }
// }
