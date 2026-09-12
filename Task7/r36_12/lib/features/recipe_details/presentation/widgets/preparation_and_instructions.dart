import 'package:flutter/material.dart';
import '../../../home/data/models/recipes_model.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class PreparationAndInstructions extends StatelessWidget {
  final Recipes recipe;
  const PreparationAndInstructions({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //preparation
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: CustomLiterataText(
            title: "Preparation",
            color: ColorsApp.darkGreenColor,
            fontSize: Fonts.fontSize20,
            fontWeight: Fonts.fontWeightBold,
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 50),

        //instructions
        ListView.builder(
          itemCount: recipe.instructions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    child: CustomLiterataText(
                      title: (index + 1).toString().padLeft(2, '0'),
                      color: ColorsApp.greyContainerColor,
                      fontSize: Fonts.fontSize32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CustomWorkSansText(
                        title: recipe.instructions[index],
                        color: ColorsApp.blackColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
