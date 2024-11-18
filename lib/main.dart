import 'package:bts_assignment/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SomeViewModel()),
        // Add more providers as needed
      ],
      child: MyApp(),
    ),
  );
}

class SomeViewModel extends ChangeNotifier {
  // Your ViewModel logic here
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}



