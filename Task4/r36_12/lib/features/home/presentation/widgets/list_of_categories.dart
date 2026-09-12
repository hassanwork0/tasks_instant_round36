import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_widget.dart';

class ListOfCategories extends StatelessWidget {
  final List<String> categories;
  String selectedCategory;
  Function onCategorySelected;

  ListOfCategories({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: List.generate(categories.length, (index) {
            final categoryName = categories[index];

            return GestureDetector(
              onTap: () => onCategorySelected(categoryName),
              child: CustomWidget(
                width: categoryName == "All" ? 60 : 80,
                height: 40,
                borderRadius: borderRadius15,
                color: selectedCategory == categoryName ? redColor : lightGreyColor,
                child: Center(
                  child: CustomText(
                    title: categoryName,
                    color:  selectedCategory == categoryName ? whiteColor : textGreyColor,
                    fontSize: fontSize15,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
