import 'package:flutter/material.dart';

import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_widget.dart';

class BtnLogin extends StatelessWidget {
  const BtnLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomWidget(
        width: double.infinity,
        height: 50,
        color: redColor,
        borderRadius: borderRadius15,
        child: Center(
          child: CustomText(
            title: "Login",
            color: whiteColor,
            fontSize: fontSize15,
            fontWeight: fontWeightBold,
          ),
        ),
      ),
    );
  }
}
