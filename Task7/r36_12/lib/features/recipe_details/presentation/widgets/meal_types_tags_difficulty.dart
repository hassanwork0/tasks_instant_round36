import 'package:flutter/material.dart';
import '../../../home/data/models/recipes_model.dart';
import 'recipe_details_rounded_container.dart';
import '../../../../core/colors/colors_app.dart';

class MealTypesTagsDifficulty extends StatelessWidget {
  final Recipes recipe;
  const MealTypesTagsDifficulty({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        side: BorderSide(color: ColorsApp.transparentColor),
        backgroundColor: ColorsApp.backGroundScaffoldColor,
        label: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 15,
          spacing: 8,
          children: [
            //meal types
            ...recipe.mealType.map(
              (mealType) => RecipeDetailsRoundedContainer(text: mealType),
            ),
            //tags
            ...recipe.tags.map(
              (tag) => RecipeDetailsRoundedContainer(text: tag),
            ),
            //difficulty,
            RecipeDetailsRoundedContainer(text: recipe.difficulty),
          ],
        ),
      ),
    );
  }
}
