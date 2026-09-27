import 'package:flutter/material.dart';
import 'package:task_products/core/constants/icon_size.dart';
import 'package:task_products/core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool viewDeleteCart;
  final void Function() onDelete;
  const CartAppBar({
    super.key,
    required this.viewDeleteCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomBodoniModaText(
        title: "Cart",
        color: ColorsApp.blackColor,
        fontSize: Fonts.fontSize25,
        fontWeight: Fonts.fontWeightW500,
      ),
      centerTitle: true,
      actions: [
        Visibility(
          visible: viewDeleteCart,
          child: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline_outlined,
              size: IconSize.iconSize25,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
