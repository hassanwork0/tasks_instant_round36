import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../products/data/models/products_model.dart';

class FirstWordTitleAndSku extends StatelessWidget {
  final Products product;
  const FirstWordTitleAndSku({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //first word title
        CustomManropeText(
          title: product.title
              .trim()
              .split(" ")
              .take(1)
              .join(" ")
              .toUpperCase(),
          color: ColorsApp.titleOneWordColor,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),

        //sku
        CustomManropeText(
          title: "SKU: ${product.sku}",
          color: ColorsApp.skuTextColor,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),
      ],
    );
  }
}
