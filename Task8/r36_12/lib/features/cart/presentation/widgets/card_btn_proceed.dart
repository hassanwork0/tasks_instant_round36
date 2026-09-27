import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class CardBtnProceed extends StatelessWidget {
  final double discountSaving;
  final double totalDue;
  const CardBtnProceed({
    super.key,
    required this.discountSaving,
    required this.totalDue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          //total, price, you save
          Column(
            spacing: 0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //total, price
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  //total
                  CustomManropeText(
                    title: "Total: ",
                    color: ColorsApp.blackColor.withValues(alpha: 0.90),
                    fontSize: Fonts.fontSize14,
                  ),
                  //price
                  CustomManropeText(
                    title: "\$${totalDue.toStringAsFixed(2)}",
                    color: ColorsApp.blackColor.withValues(alpha: 0.90),
                    fontSize: Fonts.fontSize25,
                    fontWeight: Fonts.fontWeightBold,
                  ),
                ],
              ),

              // you save
              CustomManropeText(
                title: "You save \$$discountSaving",
                color: ColorsApp.lightGreenColor,
                fontSize: Fonts.fontSize14,
              ),
            ],
          ),

          //btn proceed to checkout + icon arrow
          Container(
            width: 180,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: ColorsApp.blackColor,
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
            ),
            child: Row(
              children: [
                //btn proceed to checkout
                Expanded(
                  child: CustomManropeText(
                    title: "Proceed to \nCheckout",
                    color: ColorsApp.whiteColor,
                    fontSize: Fonts.fontSize16,
                    fontWeight: Fonts.fontWeightBold,
                    textAlign: TextAlign.center,
                  ),
                ),

                //icon arrow
                Icon(
                  Icons.arrow_forward,
                  size: IconSize.iconSize22,
                  color: ColorsApp.whiteColor,
                  fontWeight: Fonts.fontWeightBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
