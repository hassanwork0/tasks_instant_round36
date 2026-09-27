import 'package:flutter/material.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import 'product_details_rounded_container.dart';

class TagsSection extends StatelessWidget {
  final Products product;
  const TagsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        //text tags
        CustomManropeText(
          title: "TAGS:",
          color: ColorsApp.skuTextColor,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),

        //tag 1
        ProductDetailsRoundedContainer(
          containerColor: ColorsApp.blueColor.withValues(alpha: 0.15),
          borderRadiusContainer: RadiusSize.borderRadius20,
          tagName: "# ${product.tags.first}",
          textColor: ColorsApp.blackColor,
          verticalPadding: 2,
          horizontalPadding: 10,
        ),

        if (product.tags.length > 1 && product.tags.first != product.tags.last)
          //tag 2
          ProductDetailsRoundedContainer(
            containerColor: ColorsApp.blueColor.withValues(alpha: 0.15),
            borderRadiusContainer: RadiusSize.borderRadius20,
            tagName: "# ${product.tags.last}",
            textColor: ColorsApp.blackColor,
            verticalPadding: 2,
            horizontalPadding: 10,
          ),
      ],
    );
  }
}
