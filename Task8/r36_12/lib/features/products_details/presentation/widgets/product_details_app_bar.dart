import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_products/core/constants/icon_size.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleAppBar;

  const ProductDetailsAppBar({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    final String displayTitle = titleAppBar
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .join(' ');
    return AppBar(
      elevation: 1,
      shadowColor: ColorsApp.blackColor,
      title: CustomBodoniModaText(
        title: displayTitle,
        color: ColorsApp.blackColor,
        fontSize: Fonts.fontSize25,
        fontWeight: Fonts.fontWeightW500,
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
      centerTitle: true,
      leading: BackButton(
        color: ColorsApp.blueColor,
        onPressed: () {
          context.pop();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline_rounded,
            size: IconSize.iconSize25,
            color: ColorsApp.blueColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
