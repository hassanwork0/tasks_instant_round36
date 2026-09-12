import 'package:flutter/material.dart';

import '../contants.dart';

class CustomWidget extends StatelessWidget {
  Widget child;
  Color? color;
  double? height;
  double? width;
  double? borderRadius;
  bool isBorder;
  Alignment? alignment;
  CustomWidget({
    super.key,
    required this.child,
    this.color = const Color(0xffEF2A39),
    this.height = 55,
    this.width = 55,
    this.borderRadius = 20,
    this.isBorder = false,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: isBorder ? lightGreyColor : Colors.transparent ,
          width: 1,
        ),

        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: child,
    );
  }
}
