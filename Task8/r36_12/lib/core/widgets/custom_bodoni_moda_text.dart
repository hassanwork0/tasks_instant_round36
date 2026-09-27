import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBodoniModaText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double fontSize;
  final bool isLineThrough;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomBodoniModaText({
    super.key,
    required this.title,
    required this.color,
    this.fontWeight,
    this.fontStyle,
    required this.fontSize,
    this.isLineThrough = false,
    this.height,
    this.maxLines = 2,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: GoogleFonts.bodoniModa(
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
      ),
    );
  }
}
