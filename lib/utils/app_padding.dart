import 'package:flutter/material.dart';

class AppPadding {
  static double horizontal(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.04; // 4% of screen width
  }

  static double vertical(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02; // 2% of screen height
  }

  static double cardSpacing(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02; //  2% of screen width
  }
}
