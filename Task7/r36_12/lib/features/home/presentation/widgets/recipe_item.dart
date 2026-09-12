import 'package:flutter/material.dart';
import 'package:recipes_app/features/home/data/models/recipes_model.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import 'home_icon_and_text.dart';

class RecipeItem extends StatelessWidget {
  final Recipes recipe;

  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(RadiusSize.borderRadius10),
          border: Border.all(color: ColorsApp.borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RadiusSize.borderRadius10),
                bottomLeft: Radius.circular(RadiusSize.borderRadius10),
              ),

              child: Image.network(
                recipe.image,
                fit: BoxFit.cover,
                height: 175,
                width: 150,
              ),
            ),

            //title, rating, cooking time, difficulty
            Expanded(
              child: SizedBox(
                height: 175,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    //spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      CustomLiterataText(
                        title: recipe.name,
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize20,
                        fontWeight: Fonts.fontWeightBold,
                      ),

                      //rating, cooking time
                      Row(
                        children: [
                          //rating (star icon, num)
                          HomeIconAndText(
                            icon: Icons.star_border_outlined,
                            iconColor: ColorsApp.lightOrangeColor,
                            text: "${recipe.rating}",
                          ),

                          SizedBox(width: 15),

                          //cooking time (time icon, num)
                          HomeIconAndText(
                            icon: Icons.access_time_rounded,
                            iconColor: ColorsApp.darkGreyColor,
                            text: "${recipe.cookTimeMinutes} mins",
                          ),
                        ],
                      ),

                      //difficulty (icon, num)
                      HomeIconAndText(
                        icon: Icons.leaderboard_rounded,
                        iconColor: ColorsApp.darkGreyColor,
                        text: recipe.difficulty,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //icon bookmark
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Icon(
                Icons.bookmark_border_outlined,
                color: ColorsApp.darkGreenColor,
                size: IconSize.iconSize25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
