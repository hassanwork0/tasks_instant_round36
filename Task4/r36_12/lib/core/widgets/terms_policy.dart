import 'package:flutter/material.dart';

import '../contants.dart';
import 'custom_text.dart';

class TermsPolicy extends StatelessWidget {
  const TermsPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //text terms of use
        CustomText(
          title: "Terms of use",
          color: greyColor,
          fontSize: fontSize16,
          isLine: true,
        ),
        //vertical line
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: RotatedBox(
            quarterTurns: 2,
            child: Container(
              height: 15,
              width: 1,
              color: greyColor,
            ),
          ),
        ),
        //text privacy policy
        CustomText(
          title: "Privacy Policy",
          color: greyColor,
          fontSize: fontSize16,
          isLine: true,
        ),
      ],
    );
  }
}
