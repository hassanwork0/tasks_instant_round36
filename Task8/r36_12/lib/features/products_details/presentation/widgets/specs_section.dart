import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../products/data/models/products_model.dart';
import 'product_specs_item.dart';
import 'shipping_info_item.dart';

class SpecsSection extends StatelessWidget {
  final Products product;
  final Dimensions dimensions;
  const SpecsSection({
    super.key,
    required this.product,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text specs
        CustomManropeText(
          title: "PRODUCT SPECIFICATIONS",
          color: ColorsApp.tagTextColor2,
          fontSize: Fonts.fontSize12,
          fontWeight: Fonts.fontWeightBold,
        ),

        SizedBox(height: 10),

        //weight, dimensions
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            //weight
            Expanded(
              child: ProductSpecsItem(
                icon: Icons.scale_outlined,
                iconSize: IconSize.iconSize22,
                typeText: 'WEIGHT',
                text: "${product.weight} g",
              ),
            ),

            //dimensions
            ProductSpecsItem(
              icon: Icons.straighten_outlined,
              iconSize: IconSize.iconSize18,
              typeText: 'DIMENSIONS',
              text:
                  "${dimensions.width} x ${dimensions.height} x ${dimensions.depth}\ncm",
            ),
          ],
        ),

        SizedBox(height: 20),

        //shipping information
        ShippingInfoItem(shippingDays: product.shippingInformation),

        SizedBox(height: 15),

        //warranty, return policy
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            //warranty
            Expanded(
              child: ProductSpecsItem(
                icon: Icons.verified_user_outlined,
                iconSize: IconSize.iconSize18,
                typeText: 'WARRANTY',
                text: product.warrantyInformation,
              ),
            ),

            //return policy
            Expanded(
              child: ProductSpecsItem(
                icon: Icons.assignment_return_outlined,
                iconSize: IconSize.iconSize18,
                typeText: 'RETURN POLICY',
                text: product.returnPolicy,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
