import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class HeaderCart extends StatelessWidget {
  final int itemsCount;
  const HeaderCart({super.key, required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      // spacing: 10,
      children: [
        //cart items
        CustomManropeText(
          title: "Cart items",
          color: ColorsApp.blackColor,
          fontSize: Fonts.fontSize22,
          fontWeight: Fonts.fontWeightBold,
        ),

        SizedBox(width: 10),

        //12 items
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: ColorsApp.lightGreyColor.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
          ),
          child: CustomManropeText(
            title: "$itemsCount items",
            color: ColorsApp.blackColor,
            fontSize: Fonts.fontSize12,
            fontWeight: Fonts.fontWeightBold,
          ),
        ),

        Spacer(),

        //icon bookmark + save all for later
        Row(
          children: [
            //icon bookmark
            Icon(Icons.bookmark_border_outlined, color: ColorsApp.btnColor),
            //save for all later
            FittedBox(
              child: CustomManropeText(
                title: "Save All For Later",
                color: ColorsApp.blueColor,
                fontSize: Fonts.fontSize14,
                fontWeight: Fonts.fontWeightBold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
