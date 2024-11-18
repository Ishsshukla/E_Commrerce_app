import 'package:flutter/material.dart';

class AppPadding {
  static double horizontal(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.04; 
  }

  static double vertical(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02; 
  }

  static double cardSpacing(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02; 
  }
}
