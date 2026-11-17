import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class orspacer extends StatelessWidget {
  const orspacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      MYSpacer(),
      Text(" or "), 
      MYSpacer(),  
    ],
    );
  }
}

class MYSpacer extends StatelessWidget {
  const MYSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 200, height: 2, color: Colors.grey);
  }
}