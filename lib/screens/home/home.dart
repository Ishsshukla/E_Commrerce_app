import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // White Container with Curved Top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(62.0),
                  // topRight: Radius.circular(32.0),
                ),
              ),
              child: const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            // bottom:100,
            top: -350,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Section
                  const Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage(
                            'assets/profile.jpg', // Replace with profile image path
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "Paul Martine",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: Container(
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Horizontal Scrollable Cards
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10.0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              child: Image.asset(
                                'assets/bg.jpg', // Replace with your image path
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "\$34.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  "Stripe Details Jersey\nTrack Top",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  "Men's shoes",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Profile and Icons at the Top
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         // Profile Section
          //         const Row(
          //           children: [
          //             CircleAvatar(
          //               radius: 20.0,
          //               backgroundImage: AssetImage(
          //                 'assets/profile.jpg', // Replace with profile image path
          //               ),
          //             ),
          //             SizedBox(width: 8.0),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Text(
          //                   "Paul Martine",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16.0,
          //                   ),
          //                 ),
          //                 Text(
          //                   "Premium",
          //                   style: TextStyle(
          //                     color: Colors.white70,
          //                     fontSize: 14.0,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),

          //         // Icons
          //         Row(
          //           children: [
          //             IconButton(
          //               icon: const Icon(
          //                 Icons.favorite_border,
          //                 color: Colors.white,
          //               ),
          //               onPressed: () {},
          //             ),
          //             Stack(
          //               children: [
          //                 IconButton(
          //                   icon: const Icon(
          //                     Icons.shopping_cart_outlined,
          //                     color: Colors.white,
          //                   ),
          //                   onPressed: () {},
          //                 ),
          //                 Positioned(
          //                   right: 8,
          //                   bottom: 29,
          //                   // bottom: 20,
          //                   child: Container(
          //                     padding: const EdgeInsets.all(4.0),
          //                     decoration: const BoxDecoration(
          //                       color: Colors.red,
          //                       shape: BoxShape.circle,
          //                     ),
          //                     child: const Text(
          //                       "2",
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 12.0,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
