import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class RecipeDetailsRoundedContainer extends StatelessWidget {
  String text;
  RecipeDetailsRoundedContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.lightGreenColor,
        borderRadius: BorderRadius.circular(RadiusSize.borderRadius30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: CustomWorkSansText(
          title: text,
          color: ColorsApp.darkGreyColor,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),
      ),
    );
  }
}
