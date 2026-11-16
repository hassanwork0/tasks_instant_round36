import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Color color;
  final double fontsize;
  const AppLogo({super.key , this.color = Colors.white , this.fontsize = 48});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Foodgo",
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontFamily: "TitleFont",
      ),
    );
  }
}