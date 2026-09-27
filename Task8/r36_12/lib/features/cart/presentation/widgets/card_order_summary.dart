import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class CardOrderSummary extends StatelessWidget {
  final int itemsCount;
  final double subTotal;
  final double discountSaving;
  final double totalDue;
  const CardOrderSummary({
    super.key,
    required this.itemsCount,
    required this.subTotal,
    required this.discountSaving,
    required this.totalDue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order summary
            CustomManropeText(
              title: "Order Summary",
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize18,
              fontWeight: Fonts.fontWeightBold,
            ),

            //subtotal + num
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //subtotal
                CustomManropeText(
                  title: "Subtotal ($itemsCount items)",
                  color: ColorsApp.blackColor.withValues(alpha: 0.90),
                  fontSize: Fonts.fontSize16,
                ),
                //num
                CustomManropeText(
                  title: "\$${subTotal.toStringAsFixed(2)}",
                  color: ColorsApp.blackColor,
                  fontSize: Fonts.fontSize16,
                ),
              ],
            ),

            //discount saving, promo
            Row(
              spacing: 5,
              children: [
                //discount saving
                CustomManropeText(
                  title: "Discount Saving",
                  color: ColorsApp.lightGreenColor,
                  fontSize: Fonts.fontSize16,
                ),

                //promo
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      RadiusSize.borderRadius5,
                    ),
                    color: ColorsApp.promoBg,
                  ),
                  child: CustomManropeText(
                    title: "Promo",
                    color: ColorsApp.blackColor,
                    fontSize: Fonts.fontSize16,
                  ),
                ),

                Spacer(),

                //num
                CustomManropeText(
                  title: "-\$${discountSaving.toStringAsFixed(2)}",
                  color: ColorsApp.lightGreenColor,
                  fontSize: Fonts.fontSize16,
                  fontWeight: Fonts.fontWeightBold,
                ),
              ],
            ),

            //shipping
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //shipping
                CustomManropeText(
                  title: "Shipping",
                  color: ColorsApp.blackColor.withValues(alpha: 0.90),
                  fontSize: Fonts.fontSize16,
                ),
                //num
                CustomManropeText(
                  title: "FREE",
                  color: ColorsApp.lightGreenColor,
                  fontSize: Fonts.fontSize16,
                  fontWeight: Fonts.fontWeightBold,
                ),
              ],
            ),

            //estimated tax
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //estimated tax
                CustomManropeText(
                  title: "Estimated tax",
                  color: ColorsApp.blackColor.withValues(alpha: 0.90),
                  fontSize: Fonts.fontSize16,
                ),
                //num
                CustomManropeText(
                  title: "\$0.0",
                  color: ColorsApp.blackColor,
                  fontSize: Fonts.fontSize16,
                ),
              ],
            ),

            //line
            Divider(color: ColorsApp.lightGreyColor.withValues(alpha: 0.25)),

            //total due, total price,including all applied discounts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //total due
                    CustomManropeText(
                      title: "Total Duo",
                      color: ColorsApp.blackColor,
                      fontSize: Fonts.fontSize22,
                      fontWeight: Fonts.fontWeightBold,
                    ),

                    //total price
                    CustomManropeText(
                      title: "\$${totalDue.toStringAsFixed(2)}",
                      color: ColorsApp.blackColor,
                      fontSize: Fonts.fontSize25,
                      fontWeight: Fonts.fontWeightBold,
                    ),
                  ],
                ),

                //including all applied discounts
                CustomManropeText(
                  title: "Including all applied discounts",
                  color: ColorsApp.blackColor.withValues(alpha: 0.90),
                  fontSize: Fonts.fontSize16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
