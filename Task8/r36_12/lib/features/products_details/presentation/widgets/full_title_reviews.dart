import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../products/data/models/products_model.dart';

class FullTitleReviews extends StatelessWidget {
  final Products product;
  const FullTitleReviews({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        //full title
        CustomBodoniModaText(
          title: product.title,
          color: ColorsApp.blackColor,
          fontSize: Fonts.fontSize25,
          fontWeight: Fonts.fontWeightW500,
        ),

        SizedBox(height: 20),

        //reviews length
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsApp.borderStockColor.withValues(alpha: 0.20),
            ),
            borderRadius: BorderRadius.circular(RadiusSize.borderRadius5),
            color: ColorsApp.tagColorBg2.withValues(alpha: 0.90),
          ),
          child: CustomManropeText(
            title: "${product.reviews.length} reviews",
            color: ColorsApp.tagTextColor2,
            fontSize: Fonts.fontSize12,
          ),
        ),
      ],
    );
  }
}
