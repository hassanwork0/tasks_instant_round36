import 'package:flutter/material.dart';
import 'package:food_app/features/food/presentation/widgets/header_food_screen.dart';
import '../../../../core/contants.dart';
import '../../../../core/data/food_model.dart';
import '../../../../core/widgets/custom_text.dart';
import '../widgets/row_of_price_order_now.dart';
import '../widgets/row_of_spicy_portion.dart';
import '../widgets/row_of_star_rating_cooking_time.dart';

class FoodScreen extends StatelessWidget {
  final Products product;
  const FoodScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //icon arrow back, icon search
              HeaderFoodScreen(),

              //image burger
              Image.network(
                product.imagePath!,
                fit: BoxFit.cover,
                height: 250,
                width: 250,
              ),

              //burger name, star icon, rating, cooking time, description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //burger name
                    CustomText(
                      title: "${product.name} ${product.brand}",
                      color: blackColor,
                      fontWeight: fontWeightBold,
                      fontSize: fontSize20,
                    ),

                    SizedBox(height: 10),

                    //star icon, rating, cooking time
                    RowOfStarRatingCookingTime(product: product),

                    SizedBox(height: 10),

                    //description
                    TextField(
                      maxLines: 7,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: greyColor, fontSize: fontSize15),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: product.description,
                      ),
                    ),

                    SizedBox(height: 20),

                    //spicy slider, portion
                    RowOfSpicyPortion(),

                    SizedBox(height: 50),
                    //price, order now
                    RowOfPriceOrderNow(product: product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
