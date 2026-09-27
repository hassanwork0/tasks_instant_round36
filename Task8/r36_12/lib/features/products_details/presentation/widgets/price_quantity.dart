import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../products/data/models/products_model.dart';
import 'product_details_rounded_container.dart';

class PriceQuantity extends StatelessWidget {
  final Products product;
  const PriceQuantity({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorsApp.whiteColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //price + discount percentage, status + in stock
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price , discount percentage
                Row(
                  spacing: 10,
                  children: [
                    //price
                    CustomBodoniModaText(
                      title: "\$${product.price}",
                      color: ColorsApp.blueColor,
                      fontSize: Fonts.fontSize28,
                      fontWeight: Fonts.fontWeightW700,
                    ),

                    //discount percentage
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ProductDetailsRoundedContainer(
                        containerColor: ColorsApp.tagColorBg1.withValues(
                          alpha: 0.80,
                        ),
                        borderRadiusContainer: RadiusSize.borderRadius20,
                        tagName: "${product.discountPercentageInt}% OFF",
                        textColor: ColorsApp.purpleColor,
                        verticalPadding: 2,
                        horizontalPadding: 10,
                      ),
                    ),
                  ],
                ),

                //status , in stock
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //status
                    CustomManropeText(
                      title: "STATUS",
                      color: ColorsApp.tagTextColor2,
                      fontSize: Fonts.fontSize12,
                      fontWeight: Fonts.fontWeightBold,
                    ),
                    //in stock
                    CustomManropeText(
                      title: product.availabilityStatus,
                      color: ColorsApp.stockTextColor,
                      fontSize: Fonts.fontSize16,
                      fontWeight: Fonts.fontWeightW700,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            //line
            Divider(
              color: ColorsApp.borderStockColor.withValues(alpha: 0.30),
              thickness: 1.5,
            ),

            SizedBox(height: 10),

            //text min order quantity , units
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //text min order quantity
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      color: ColorsApp.titleOneWordColor,
                      size: IconSize.iconSize18,
                      fontWeight: Fonts.fontWeightBold,
                    ),
                    CustomManropeText(
                      title: "Minimum Order Quantity",
                      color: ColorsApp.tagTextColor2,
                      fontSize: Fonts.fontSize14,
                    ),
                  ],
                ),

                //units
                CustomManropeText(
                  title: "${product.minimumOrderQuantity} units",
                  color: ColorsApp.blackColor,
                  fontSize: Fonts.fontSize16,
                  fontWeight: Fonts.fontWeightW700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
