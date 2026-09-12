import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLiterataText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;
  final double? height;
  final TextAlign? textAlign;

  const CustomLiterataText({
    super.key,
    required this.title,
    required this.color,
    this.fontWeight,
    required this.fontSize,
    this.height,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      softWrap: true,
      textAlign: textAlign,
      style: GoogleFonts.literata(
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
