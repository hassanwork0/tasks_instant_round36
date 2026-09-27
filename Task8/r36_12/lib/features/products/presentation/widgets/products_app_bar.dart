import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_products/core/constants/icon_size.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomBodoniModaText(
        title: "Products",
        color: ColorsApp.blackColor,
        fontSize: Fonts.fontSize25,
        fontWeight: Fonts.fontWeightW500,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.push(Routes.cart);
        },
        icon: Icon(Icons.shopping_cart_outlined, size: IconSize.iconSize25),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.push(Routes.searchProduct);
          },
          icon: Icon(Icons.search_rounded, size: 25),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
