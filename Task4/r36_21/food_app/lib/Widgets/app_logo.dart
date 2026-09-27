import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Color color;
  final double fontSize;
  const AppLogo({
    super.key,
    this.color = Colors.black,
    this.fontSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Foodgo',
      style: TextStyle(color: color,
        fontSize: fontSize,
        fontFamily: 'TitleFont'),
    );
  }
}