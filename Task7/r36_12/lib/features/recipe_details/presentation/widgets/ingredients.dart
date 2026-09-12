import 'package:flutter/material.dart';
import '../../../home/data/models/recipes_model.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class Ingredients extends StatelessWidget {
  final Recipes recipe;
  const Ingredients({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          border: Border.all(color: ColorsApp.borderColor),
          borderRadius: BorderRadius.circular(RadiusSize.borderRadius10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //text ingredients, serves
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //text ingredients
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: CustomLiterataText(
                      title: "Ingredients",
                      color: ColorsApp.darkGreenColor,
                      fontSize: Fonts.fontSize20,
                      fontWeight: Fonts.fontWeightBold,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //serves
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          RadiusSize.borderRadius10,
                        ),
                        color: ColorsApp.backGroundScaffoldColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWorkSansText(
                          title: "Serves ${recipe.servings}",
                          color: ColorsApp.darkGreenColor,
                          fontSize: Fonts.fontSize16,
                          fontWeight: Fonts.fontWeightBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            //line
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: ColorsApp.borderColor),
              ),
            ),

            SizedBox(height: 15),

            //checkbox
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: false,

                        onChanged: (value) {},
                        side: BorderSide(
                          color: ColorsApp.borderColor,
                          width: 1.2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            RadiusSize.borderRadius5,
                          ),
                        ),

                        activeColor: ColorsApp.darkGreenColor,
                        //visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),

                    const SizedBox(width: 8),

                    CustomWorkSansText(
                      title: recipe.ingredients[index],
                      color: ColorsApp.blackColor,
                      fontSize: Fonts.fontSize16,
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
