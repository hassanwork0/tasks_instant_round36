import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class ShippingInfoItem extends StatelessWidget {
  final String shippingDays;
  const ShippingInfoItem({super.key, required this.shippingDays});

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          //icon
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
            decoration: BoxDecoration(
              color: ColorsApp.blueColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius10),
            ),
            child: Icon(
              Icons.local_shipping_outlined,
              size: IconSize.iconSize22,
              color: ColorsApp.blueColor,
              weight: 100,
            ),
          ),

          //text shipping information, value
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text shipping information
              CustomManropeText(
                title: "SHIPPING INFORMATION",
                color: ColorsApp.tagTextColor2,
                fontSize: Fonts.fontSize14,
                fontWeight: Fonts.fontWeightBold,
              ),

              //value
              CustomManropeText(
                title: shippingDays,
                color: ColorsApp.blackColor,
                fontSize: Fonts.fontSize18,
                fontWeight: Fonts.fontWeightBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
