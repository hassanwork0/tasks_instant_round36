import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class CardBtnAddToBag extends StatelessWidget {
  final double price;
  final int units;
  final bool viewCardBtn;
  const CardBtnAddToBag({
    super.key,
    required this.price,
    required this.units,
    required this.viewCardBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: viewCardBtn,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ColorsApp.blackColor.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //price + unit, MOQ + units , btn
            Column(
              spacing: 0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //price, unit
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    //price
                    CustomManropeText(
                      title: "\$$price ",
                      color: ColorsApp.blueColor,
                      fontSize: Fonts.fontSize25,
                      fontWeight: Fonts.fontWeightBold,
                    ),
                    //unit
                    CustomManropeText(
                      title: "/ unit",
                      color: ColorsApp.blackColor.withValues(alpha: 0.90),
                      fontSize: Fonts.fontSize14,
                    ),
                  ],
                ),

                //MOQ, units
                CustomManropeText(
                  title: "MOQ: $units units",
                  color: ColorsApp.titleOneWordColor,
                  fontSize: Fonts.fontSize14,
                  fontWeight: Fonts.fontWeightW700,
                ),
              ],
            ),

            //btn proceed to checkout + icon arrow
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: ColorsApp.btnColor,
                borderRadius: BorderRadius.circular(RadiusSize.borderRadius10),
              ),
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icon bag
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: IconSize.iconSize22,
                    color: ColorsApp.whiteColor,
                    fontWeight: Fonts.fontWeightBold,
                  ),

                  //btn add to bag
                  CustomManropeText(
                    title: "ADD $units TO BAG",
                    color: ColorsApp.whiteColor,
                    fontSize: Fonts.fontSize14,
                    fontWeight: Fonts.fontWeightW500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
