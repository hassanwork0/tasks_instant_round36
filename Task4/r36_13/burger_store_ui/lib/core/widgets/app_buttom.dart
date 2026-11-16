import 'package:flutter/material.dart';

class AppButtom extends StatelessWidget {
  final Widget child;
  final double width;
  final double heigth;
  final Color color;
  final VoidCallback? onPressed;
  const AppButtom({
    super.key,
    required this.child,
    this.width = 60,
    this.heigth = 60,
    this.color = Colors.red, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Center(child: child),
      ),
    );
  }
}