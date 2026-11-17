import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPress;
  const MYButton({
    required this.text,
    required this.onPress,
    this.color = Colors.orange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPress ?? () {},
      child: SizedBox(
        width: 150,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}