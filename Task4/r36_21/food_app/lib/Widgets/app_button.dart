import 'package:flutter/material.dart';
import 'package:food_app/core/colors/colors.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final Widget? child; 
  final IconData? icon;
  final double iconSize;
  final VoidCallback? onPressed;
  const AppButton({
    super.key,
    this.width = 60,
    this.height = 60,
    this.color,
    this.child,
    this.icon,
    this.iconSize = 32,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed??(){},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color ?? AppColors.appRed
        ),
        child:Center(
          child: child ?? Icon(
                icon,
                color: Colors.white,
                size: iconSize
              ),
            ),
        ),
    );
  }
}