import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipes_cubit.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipesErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RecipesCubit>().fetchRecipes();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is RecipesLoadedState) {
            if (state.recipes.isEmpty) {
              return const Center(child: Text('No recipes found'));
            }
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final product = state.recipes[index];
                return ProductWidget(product: product);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
