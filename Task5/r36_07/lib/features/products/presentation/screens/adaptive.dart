import 'package:flutter/widgets.dart';

class Adaptive {
  static EdgeInsets screenPadding(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width >= 1200) return EdgeInsets.all(24);
    if (width >= 800) return EdgeInsets.all(16);
    return EdgeInsets.all(12);
  }

  static double itemSpacing(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width >= 1200) return 24;
    if (width >= 800) return 16;
    return 12;
  }
}
