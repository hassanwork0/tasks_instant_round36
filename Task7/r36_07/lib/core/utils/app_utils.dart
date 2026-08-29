import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppUtils {
  static Color getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return AppColors.difficultyEasy;
      case 'medium':
        return AppColors.difficultyMedium;
      case 'hard':
        return AppColors.difficultyHard;
      default:
        return AppColors.textSecondary;
    }
  }

  static String ratingToString(double rating) => rating.toStringAsFixed(1);
}
