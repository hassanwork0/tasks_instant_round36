import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;
  final bool isLine;
  final double? height;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    required this.title,
    required this.color,
    this.fontWeight,
    required this.fontSize,
    this.isLine = false,
    this.height,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: isLine ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
