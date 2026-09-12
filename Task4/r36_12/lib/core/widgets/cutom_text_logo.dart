import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextLogo extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;

  const CustomTextLogo({
    super.key,
    required this.title,
    required this.color,
    this.fontWeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lobster(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
