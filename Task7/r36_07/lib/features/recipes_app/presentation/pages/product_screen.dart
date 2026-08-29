import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/const/app_const.dart';
import '../../../../core/utils/app_utils.dart';
import '../../data/model/product_model.dart';
import '../widgets/title_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.product});

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final ProductModel recipe = product!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TitleBar(title: recipe.name),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.network(
            recipe.image,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: 260,
              color: AppColors.primaryLighter,
              child: const Icon(
                Icons.restaurant_menu,
                size: 80,
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddings.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppPaddings.small),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.primary, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${AppUtils.ratingToString(recipe.rating)} (${recipe.reviewCount})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: AppPaddings.large),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppUtils.getDifficultyColor(recipe.difficulty),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        recipe.difficulty,
                        style:
                            const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppPaddings.small),
                Text(
                  recipe.cuisine,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppPaddings.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoItem(
                      icon: Icons.schedule,
                      label: AppString.prepTime,
                      value: '${recipe.prepTimeMinutes} ${AppString.minutes}',
                    ),
                    _InfoItem(
                      icon: Icons.timer,
                      label: AppString.cookTime,
                      value: '${recipe.cookTimeMinutes} ${AppString.minutes}',
                    ),
                    _InfoItem(
                      icon: Icons.people,
                      label: AppString.servings,
                      value: '${recipe.servings}',
                    ),
                    _InfoItem(
                      icon: Icons.local_fire_department,
                      label: 'Calories',
                      value: '${recipe.caloriesPerServing}',
                    ),
                  ],
                ),
                const SizedBox(height: AppPaddings.large),
                const Text(
                  AppString.ingredients,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppPaddings.small),
                ...recipe.ingredients.map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,
                            color: AppColors.primary, size: 18),
                        const SizedBox(width: AppPaddings.small),
                        Expanded(
                          child: Text(
                            ingredient,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppPaddings.large),
                const Text(
                  AppString.instructions,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppPaddings.small),
                ...recipe.instructions.asMap().entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPaddings.small,
                          left: 4,
                        ),
                        child: Text(
                          '${entry.key + 1}. ${entry.value}',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
