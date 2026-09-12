import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class RecipeDetailsIconAndText extends StatelessWidget {
  final IconData icon;
  final FontWeight? fontWeightIcon;
  final String text;
  final FontWeight? fontWeightText;
  final bool isOrange;

  const RecipeDetailsIconAndText({
    super.key,
    required this.icon,
    this.fontWeightIcon,
    required this.text,
    this.fontWeightText,
    this.isOrange = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //icon
        Icon(
          icon,
          color: isOrange ? ColorsApp.darkOrangeColor : ColorsApp.darkGreyColor,
          size: IconSize.iconSize25,
          fontWeight: fontWeightIcon,
        ),

        SizedBox(width: 3),

        //num
        CustomWorkSansText(
          title: text,
          color: ColorsApp.darkGreyColor,
          fontSize: Fonts.fontSize18,
          fontWeight: fontWeightText,
        ),
      ],
    );
  }
}
