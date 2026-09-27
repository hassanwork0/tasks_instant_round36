import 'package:flutter/material.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class ProductDetailsRoundedContainer extends StatelessWidget {
  final Color containerColor;
  final double borderRadiusContainer;
  final String tagName;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  const ProductDetailsRoundedContainer({
    super.key,
    required this.containerColor,
    this.borderRadiusContainer = RadiusSize.borderRadius20,
    required this.tagName,
    required this.textColor,
    this.verticalPadding = 5,
    this.horizontalPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadiusContainer),
      ),
      child: CustomManropeText(
        title: tagName,
        color: textColor,
        fontSize: Fonts.fontSize14,
        fontWeight: Fonts.fontWeightBold,
      ),
    );
  }
}
