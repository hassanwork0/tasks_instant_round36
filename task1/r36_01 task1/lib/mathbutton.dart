import 'package:flutter/material.dart';

class MathButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const MathButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2235),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(5, 5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black,
            offset: const Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.zero,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}