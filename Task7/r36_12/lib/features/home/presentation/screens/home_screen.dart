import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/features/home/presentation/widgets/recipe_item.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import '../../../../core/widgets/custom_worksans_text.dart';
import '../../../../core/widgets/recipe_app_bar.dart';
import '../../data/models/recipes_model.dart';
import '../cubit/home_cubit.dart';
import '../widgets/list_of_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state) {
            case HomeInitialState():
              return SizedBox();
            case HomeLoadingState():
              return RecipesShimmer();

            case HomeLoadedState():
              final recipes = state.filteredRecipesList;
              return recipes.isEmpty
                  ? EmptyRecipeList()
                  : RecipesList(
                      recipesList: recipes,
                      categoryList: ListOfCategories(
                        categoryNames: state.categoryNames,
                        selectedCategoryName: state.selectedCategory,
                        onCategorySelected: (category) {
                          context.read<HomeCubit>().selectCategory(category);
                        },
                      ),
                    );

            case HomeFailureState():
              return ErrorRecipe();
          }
        },
      ),
    );
  }
}

class RecipesShimmer extends StatelessWidget {
  const RecipesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      appBar: const RecipeAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),

          //categories
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: index == 0 ? 65 : 110,
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorsApp.whiteColor,
                          borderRadius: BorderRadius.circular(
                            RadiusSize.borderRadius30,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 30),

          //recipes
          ListView.builder(

            itemCount: 3,

            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {

              return Shimmer.fromColors(

                baseColor: Colors.grey.shade300,

                highlightColor: Colors.grey.shade100,

                child: Container(

                  width: double.infinity,

                  height: 175,

                  margin: const EdgeInsets.all(12),

                  decoration: BoxDecoration(

                    color: Colors.black,

                    borderRadius: BorderRadius.circular(15),

                  ),

                ),

              );

            },

          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class RecipesList extends StatelessWidget {
  final List<Recipes> recipesList;
  final Widget categoryList;
  const RecipesList({
    super.key,
    required this.recipesList,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      appBar: RecipeAppBar(title: "Recipes",),
      body: Column(
        children: [
          SizedBox(height: 20),

          //categories
          categoryList,

          SizedBox(height: 30),

          //card of recipes
          Expanded(
            child: ListView.builder(
              itemCount: recipesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final recipe = recipesList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      context.push(Routes.recipeDetails, extra: recipe);
                    },
                    child: RecipeItem(recipe: recipe),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class EmptyRecipeList extends StatelessWidget {
  const EmptyRecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      appBar: RecipeAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          SizedBox(height: 100),

          //icon steam
          Image.asset(Assets.steamIconImage, fit: BoxFit.cover),

          //icon spoon
          Container(
            width: 120,
            height: 150,
            padding: EdgeInsets.all(30),

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(70),
              color: ColorsApp.backGroundContainerColor,
              border: Border.all(color: ColorsApp.borderColor),
            ),
            child: Image.asset(Assets.spoonIconImage, fit: BoxFit.contain),
          ),

          SizedBox(height: 20),

          //text No Recipes Found
          CustomLiterataText(
            title: "No Recipes Found",
            color: ColorsApp.darkGreenColor,
            fontSize: Fonts.fontSize25,
            fontWeight: Fonts.fontWeightBold,
          ),

          SizedBox(height: 20),
          //text error
          CustomWorkSansText(
            title:
                "Your culinary journey begins here. Start exploring new flavors or add your first family recipe to build your heritage.",
            color: ColorsApp.darkGreyColor,
            fontSize: Fonts.fontSize16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ErrorRecipe extends StatelessWidget {
  const ErrorRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundScaffoldColor,
      appBar: RecipeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 50),

          //icon fork & spoon
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsApp.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsApp.backGroundScaffoldColor,
                border: Border.all(color: ColorsApp.borderColor2),
              ),
              child: Icon(
                Icons.local_restaurant,
                size: 90,
                color: ColorsApp.lightGreyColor,
              ),
            ),
          ),

          SizedBox(height: 50),

          //text Something went wrong.
          CustomLiterataText(
            title: "Something went wrong.",
            color: ColorsApp.darkGreenColor,
            fontSize: Fonts.fontSize35,
            fontWeight: Fonts.fontWeightBold,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          //text We couldn't fetch your recipes. Please
          CustomWorkSansText(
            title:
                "We couldn't fetch your recipes. Please check your connection or try again later.",
            color: ColorsApp.darkGreyColor,
            fontSize: Fonts.fontSize18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
