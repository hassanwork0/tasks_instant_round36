import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class ListOfCategories extends StatelessWidget {
  final List<String> categoryNames;
  final String selectedCategoryName;
  final Function(String) onCategorySelected;

  const ListOfCategories({
    super.key,
    required this.categoryNames,
    required this.selectedCategoryName,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryNames.length + 1,
          itemBuilder: (context, index) {
            final category = index == 0 ? "All" : categoryNames[index - 1];

            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => onCategorySelected(category),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedCategoryName == category
                        ? ColorsApp.lightGreenColor
                        : ColorsApp.whiteColor,
                    border: Border.all(color: ColorsApp.borderColor),
                    borderRadius: BorderRadius.circular(
                      RadiusSize.borderRadius30,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: CustomWorkSansText(
                    title: category,
                    color: selectedCategoryName == category
                        ? ColorsApp.darkGreenColor
                        : ColorsApp.darkGreyColor,
                    fontSize: Fonts.fontSize18,
                    fontWeight: Fonts.fontWeightBold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
