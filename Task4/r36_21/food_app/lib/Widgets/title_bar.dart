import 'package:flutter/material.dart';
import 'package:food_app/Widgets/app_logo.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLogo(fontSize: 36,),
          Text("Order your favourite food!",
          style: TextStyle(color: Colors.grey, fontSize: 16),)
        ],
      ),
      Icon(Icons.account_circle_rounded, size: 48,)
    ],);
  }
}