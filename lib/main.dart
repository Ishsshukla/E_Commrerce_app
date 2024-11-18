import 'package:bts_assignment/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductListingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
