import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class HomeIconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const HomeIconAndText({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //icon
        Icon(icon, color: iconColor, size: IconSize.iconSize18),

        SizedBox(width: 3),

        //text
        CustomWorkSansText(
          title: text,
          color: ColorsApp.darkGreyColor,
          fontSize: Fonts.fontSize18,
        ),
      ],
    );
  }
}
