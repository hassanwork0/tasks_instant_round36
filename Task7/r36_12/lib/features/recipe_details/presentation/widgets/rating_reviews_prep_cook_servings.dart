import 'package:flutter/material.dart';
import '../../../home/data/models/recipes_model.dart';
import 'calorie_icon_and_num.dart';
import 'recipe_details_icon_and_text.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class RatingReviewsPrepCookServings extends StatelessWidget {
  final Recipes recipe;
  const RatingReviewsPrepCookServings({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //rating ,reviews, prep time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //rating ,reviews
            Row(
              children: [
                RecipeDetailsIconAndText(
                  icon: Icons.star_border_outlined,
                  fontWeightIcon: Fonts.fontWeightBold,
                  text: recipe.rating.toString(),
                  fontWeightText: Fonts.fontWeightBold,
                  isOrange: true,
                ),

                SizedBox(width: 5),

                //reviews
                CustomWorkSansText(
                  title: "(${recipe.reviewCount} reviews)",
                  color: ColorsApp.darkGreyColor,
                  fontSize: Fonts.fontSize18,
                ),
              ],
            ),

            //prep time
            RecipeDetailsIconAndText(
              icon: Icons.access_time_rounded,
              text: "Prep: ${recipe.prepTimeMinutes} mins",
            ),
          ],
        ),

        SizedBox(height: 20),

        //cook time, servings
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //cooking time
            RecipeDetailsIconAndText(
              icon: Icons.local_fire_department_outlined,
              fontWeightIcon: Fonts.fontWeightBold,
              text: "Cook: ${recipe.cookTimeMinutes} min",
            ),

            //servings
            RecipeDetailsIconAndText(
              icon: Icons.people_alt_outlined,
              text: "Yields: ${recipe.servings} servings",
            ),
          ],
        ),

        SizedBox(height: 20),

        //calorie (icon + num)
        CalorieIconAndNum(calorieNum: "${recipe.caloriesPerServing} kcal"),
      ],
    );
  }
}
