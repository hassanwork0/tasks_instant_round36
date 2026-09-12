import 'package:flutter/material.dart';
import 'package:food_app/core/data/food_model.dart';

import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class RowOfStarRatingCookingTime extends StatelessWidget {
  final Products product;
  RowOfStarRatingCookingTime({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //star icon, rating
    return Row(
      children: [
        //star icon, rating
        Row(
          children: [
            //star icon
            Icon(Icons.star, size: iconSize20, color: orangeColor),
            SizedBox(width: 5),

            //rating
            CustomText(
              title: "${product.rating}",
              color: greyColor,
              fontSize: fontSize15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),

        Icon(Icons.remove_rounded,color: greyColor),
        //cooking time
        CustomText(
          title: "${product.deliveryTime} mins",
          color: greyColor,
          fontSize: fontSize15,
          fontWeight: fontWeightBold,
        ),
      ],
    );
  }
}
