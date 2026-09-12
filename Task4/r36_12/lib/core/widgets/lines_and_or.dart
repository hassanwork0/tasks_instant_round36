import 'package:flutter/material.dart';

import '../contants.dart';
import 'custom_text.dart';

class LinesAndOr extends StatelessWidget {
  const LinesAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //left line
        Container(width: 105, height: 1, color: lightGreyColor),
        //text or
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            title: "OR",
            color: greyColor,
            fontSize: fontSize16,
          ),
        ),
        //right line
        Container(width: 105, height: 1, color: lightGreyColor),
      ],
    );
  }
}
