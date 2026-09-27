import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_products/core/colors/colors_app.dart';

class CustomManropeText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double fontSize;
  final bool isLineThrough;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;

  const CustomManropeText({
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
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.manrope(
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
        decoration: isLineThrough
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: isLineThrough
            ? ColorsApp.lightGreyColor
            : ColorsApp.blackColor,
      ),
    );
  }
}
