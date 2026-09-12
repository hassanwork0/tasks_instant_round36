import 'package:flutter/material.dart';
import 'package:recipes_app/core/colors/colors_app.dart';
import 'package:recipes_app/features/home/data/models/recipes_model.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import '../widgets/ingredients.dart';
import '../widgets/meal_types_tags_difficulty.dart';
import '../widgets/preparation_and_instructions.dart';
import '../widgets/rating_reviews_prep_cook_servings.dart';
import '../widgets/image_and_icons.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipes recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image, icon back, icon bookmark
              ImageAndIcons(image: recipe.image),

              SizedBox(height: 80),

              //meal types, tags, difficulty
              MealTypesTagsDifficulty(recipe: recipe),

              SizedBox(height: 35),

              //name recipe
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: CustomLiterataText(
                    title: recipe.name,
                    color: ColorsApp.darkGreenColor,
                    fontSize: Fonts.fontSize30,
                    fontWeight: Fonts.fontWeightBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //rating ,reviews, prep time, cook time, servings
              RatingReviewsPrepCookServings(recipe: recipe),

              SizedBox(height: 35),

              //ingredients
              Ingredients(recipe: recipe),

              SizedBox(height: 35),

              //preparation, instructions
              PreparationAndInstructions(recipe: recipe),
            ],
          ),
        ),
      ),
    );
  }
}
