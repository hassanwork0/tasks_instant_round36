import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({super.key, required this.title, this.showBack = true});

  final String title;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: showBack,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      centerTitle: true,
    );
  }
}
