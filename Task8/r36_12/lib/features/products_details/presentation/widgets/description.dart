import 'package:flutter/material.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class Description extends StatelessWidget {
  final Products product;
  const Description({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text description
        CustomManropeText(
          title: "DESCRIPTION",
          color: ColorsApp.tagTextColor2,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),

        //value description
        CustomManropeText(
          title: product.description,
          color: ColorsApp.blackColor,
          fontSize: Fonts.fontSize16,
          maxLines: null,
        ),
      ],
    );
  }
}
