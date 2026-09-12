import 'package:flutter/material.dart';
import 'package:food_app/core/images.dart';

import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_widget.dart';

class AnotherWayLogin extends StatelessWidget {
  const AnotherWayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //icon google
        CustomWidget(
          height: 50,
          width: 110,
          color: whiteColor,
          isBorder: true,
          borderRadius: borderRadius15,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(Images.googleIcon),
          ),
        ),
        //icon ios
        CustomWidget(
          height: 50,
          width: 110,
          color: whiteColor,
          isBorder: true,
          borderRadius: borderRadius15,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(Images.iosIcon),
          ),
        ),
        //icon phone
        CustomWidget(
          height: 50,
          width: 110,
          color: whiteColor,
          isBorder: true,
          borderRadius: borderRadius15,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(Images.phoneIcon),
          ),
        ),
      ],
    );
  }
}
