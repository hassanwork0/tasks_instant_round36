import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/const/app_const.dart';
import '../../../../core/routes/routes_name.dart';
import '../../data/model/product_model.dart';
import '../bloc/recipes_cubit.dart';
import '../bloc/recipes_state.dart';
import '../widgets/app_button.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _goToProduct(ProductModel product) {
    Navigator.of(context).pushNamed(RoutesName.product, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSearchBar(
                controller: _searchController,
                onChanged: (query) =>
                    context.read<RecipesCubit>().searchRecipes(query),
              ),
              const SizedBox(height: AppPaddings.medium),
              Expanded(
                child: BlocBuilder<RecipesCubit, RecipesState>(
                  builder: (context, state) {
                    if (state is RecipesLoadingState) {
                      return const _LoadingView();
                    } else if (state is RecipesErrorState) {
                      return _ErrorView(errorMessage: state.errorMessage);
                    } else if (state is RecipesLoadedState) {
                      if (state.recipes.isEmpty) {
                        return const _EmptyView();
                      }
                      return ListView.builder(
                        padding:
                            const EdgeInsets.only(top: AppPaddings.small),
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          final product = state.recipes[index];
                          return ProductWidget(
                            product: product,
                            onTap: () => _goToProduct(product),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatefulWidget {
  const _LoadingView();

  @override
  State<_LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<_LoadingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = 0.45 + (_controller.value * 0.25);
        return Opacity(opacity: value, child: child);
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(top: AppPaddings.small),
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: AppPaddings.large),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  color: AppColors.textSecondary.withValues(alpha: 0.12),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        width: 170,
                        decoration: BoxDecoration(
                          color:
                              AppColors.textSecondary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Container(
                            height: 14,
                            width: 90,
                            decoration: BoxDecoration(
                              color: AppColors.textSecondary
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 26,
                            width: 72,
                            decoration: BoxDecoration(
                              color: AppColors.textSecondary
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.textSecondary
                                  .withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                color: AppColors.primaryLighter,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                size: 44,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppPaddings.large),
            const Text(
              AppString.somethingWentWrong,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppPaddings.small),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppPaddings.large),
            AppButton(
              text: AppString.retry,
              onPressed: () => context.read<RecipesCubit>().fetchRecipes(),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: const BoxDecoration(
              color: AppColors.primaryLighter,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search_off,
              size: 44,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppPaddings.large),
          const Text(
            AppString.noRecipesFound,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}