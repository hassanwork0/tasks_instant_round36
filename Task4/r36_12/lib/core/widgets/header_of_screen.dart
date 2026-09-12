import 'package:flutter/material.dart';

import '../contants.dart';
import 'custom_text.dart';

class HeaderOfScreen extends StatelessWidget {
  final String title;
  final String imageIcon;
  final double heightImage;
  final double widthImage;
  final String subTitle;
  final double? height;

  const HeaderOfScreen({
    super.key,
    required this.title,
    required this.imageIcon,
    required this.heightImage,
    required this.widthImage,
    required this.subTitle,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon info
        Padding(
          padding: const EdgeInsets.only(right: 5, top: 25),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.error_outline_outlined, size: iconSize25),
            ),
          ),
        ),
        //text title, icon
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text title
            CustomText(
              title: title,
              color: blackColor,
              fontSize: fontSize25,
              fontWeight: fontWeightBold,
            ),
            //icon image
            Image.asset(imageIcon, height: heightImage, width: widthImage),
          ],
        ),

        //text subtitle
        CustomText(
            title: subTitle,
            color: textGreyColor,
            fontSize: fontSize16, height: height,),
      ],
    );
  }
}
