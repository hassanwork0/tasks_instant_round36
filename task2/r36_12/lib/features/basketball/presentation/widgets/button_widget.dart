import 'package:flutter/material.dart';

import '../../../../core/constant.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final EdgeInsets edges;
  const ButtonWidget({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.edges,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: edges,
      onPressed: onPressed,
      color: orangeColor,
      child: Text(
        btnText,
        style: TextStyle(
          color: blackColor,
          fontSize: fontSize15,
          fontWeight: fontWeightBold,
        ),
      ),
    );
  }
}
