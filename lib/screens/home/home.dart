// import 'package:bts_assignment/providers/product_provider.dart';
// import 'package:bts_assignment/widgets/navbar/navbar.dart';
// import 'package:bts_assignment/widgets/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       body: Column(
//         children: [
//           // App Bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                const Row(
//                   children: [
//                     const CircleAvatar(
//                       backgroundImage: NetworkImage(
//                         'https://i.pravatar.cc/150?img=3', // Replace with user's profile image URL
//                       ),
//                       radius: 24,
//                     ),
//                     const SizedBox(width: 12),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Paul Martine',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Premium',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Stack(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.shopping_cart_outlined,
//                         size: 28,
//                       ),
//                       onPressed: () {},
//                     ),
//                     Positioned(
//                       right: 4,
//                       top: 4,
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: const BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Text(
//                           '02',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Hero Section
//           Stack(
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                     image: NetworkImage('https://i.pravatar.cc/150?img=3'), // Replace with your network image URL
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               const Positioned(
//                 bottom: 16,
//                 left: 16,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'The Ultimate Collection',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       'Step into style',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white70,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Product Grid
//           Expanded(
//             child: productProvider.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : GridView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: productProvider.products.length,
//                 itemBuilder: (context, index) {
//                   final product = productProvider.products[index];
                  
// return ProductCard(
//                   id: product.id,
//                   title: product.title,
//                   description: product.description,
//                   price: product.price,
//                   imageUrl: product.imageUrl,
//                   category: product.category,
//                 ) as Widget;
//                 },
//                   ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0, onTap: _onItemTapped)
//     );
//   }
// }
