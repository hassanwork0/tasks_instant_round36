import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/const/app_const.dart';
import 'search_text_field.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Recipes',
                style: TextStyle(color: AppColors.primary),
              ),
              TextSpan(
                text: ' App',
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            height: 1.1,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: AppPaddings.large),
        SearchTextField(controller: controller, onChanged: onChanged),
      ],
    );
  }
}