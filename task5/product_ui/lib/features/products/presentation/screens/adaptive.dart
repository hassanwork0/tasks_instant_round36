import 'package:flutter/material.dart';

class Adaptive {
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  static int gridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1000) return 4;
    if (width >= 600) return 3;
    return 1;
  }
}
