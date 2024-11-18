// import 'package:bts_assignment/providers/favourites_provider.dart';
// import 'package:bts_assignment/widgets/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import '../providers/favorites_provider.dart';
// // import '../widgets/product_card.dart';

// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({Key? key}) : super(key: key);

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
//     favoritesProvider.loadFavoritesFromDb();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = Provider.of<FavoritesProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorites'),
//       ),
//       body: favoritesProvider.favorites.isEmpty
//           ? const Center(
//               child: Text('No favorites yet!'),
//             )
//           : GridView.builder(
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 3 / 4,
//               ),
//               itemCount: favoritesProvider.favorites.length,
//               itemBuilder: (context, index) {
//                 final product = favoritesProvider.favorites[index];
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
