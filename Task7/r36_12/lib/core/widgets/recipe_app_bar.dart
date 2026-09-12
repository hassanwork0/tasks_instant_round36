import 'package:flutter/material.dart';
import '../colors/colors_app.dart';
import '../constants/fonts.dart';
import '../constants/icon_size.dart';
import 'custom_literata_text.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const RecipeAppBar({super.key, this.title = "Culinary Heritage"});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: ColorsApp.blackColor,
      centerTitle: true,
      title: CustomLiterataText(
        title: title,
        color: ColorsApp.darkGreenColor,
        fontSize: title == "Recipes" ? Fonts.fontSize35 : Fonts.fontSize25,
        fontWeight: Fonts.fontWeightBold,
      ),
      leading: Icon(
        Icons.menu,
        color: ColorsApp.darkGreenColor,
        size: IconSize.iconSize25,
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        Icon(
          Icons.search_rounded,
          color: ColorsApp.darkGreenColor,
          size: IconSize.iconSize25,
        ),
      ],
    );
  }
}
