import 'package:flutter/material.dart';

import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class DontHaveCreateOne extends StatelessWidget {
  const DontHaveCreateOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //text don't have an account
        CustomText(
          title: "Don't have an account?",
          color: greyColor,
          fontSize: fontSize16,
        ),
        SizedBox(width: 5),
        //text create one
        CustomText(title: "Create one", color: redColor, fontSize: fontSize16),
      ],
    );
  }
}
