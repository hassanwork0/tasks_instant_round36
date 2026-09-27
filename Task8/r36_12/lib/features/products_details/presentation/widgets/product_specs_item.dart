import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class ProductSpecsItem extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String typeText;
  final String text;

  const ProductSpecsItem({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.typeText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorsApp.tagColorBg1.withValues(alpha: 0.55),
        border: Border.all(
          color: ColorsApp.borderStockColor.withValues(alpha: 0.20),
        ),
        borderRadius: BorderRadius.circular(RadiusSize.borderRadius5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //icon + text
          Row(
            spacing: 5,
            children: [
              //icon
              Icon(
                icon,
                color: ColorsApp.titleOneWordColor,
                size: iconSize,
                weight: 100,
              ),

              //type text
              CustomManropeText(
                title: typeText,
                color: ColorsApp.tagTextColor2,
                fontSize: Fonts.fontSize14,
                fontWeight: Fonts.fontWeightBold,
              ),
            ],
          ),

          //value
          FittedBox(
            child: CustomManropeText(
              title: text,
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize18,
              fontWeight: Fonts.fontWeightBold,
            ),
          ),
        ],
      ),
    );
  }
}
