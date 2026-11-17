import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';
import 'package:recipes_ui/features/recipes/presentation/bloc/recipes_cubit.dart';
import 'package:recipes_ui/features/recipes/presentation/bloc/recipes_state.dart';
import 'package:recipes_ui/features/recipes/presentation/widgets/category_chips.dart';
import 'package:recipes_ui/features/recipes/presentation/widgets/recipes_card.dart';
import 'package:recipes_ui/features/recipes/presentation/widgets/recipes_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("Recipes", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                "assets/potato.jpg",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          switch (state) {
            case RecipesInitialState():
              return SizedBox();
            case RecipesLoadingState():
              return HomeShimmer();
            case RecipesLoadedState(:final recipes):
              return SucessRecipes(recipes: recipes);
            case RecipesFailureState(:final errorMessage):
              return FailureRecipes(errorMessage: errorMessage);
          }
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cookie), label: "Recipes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.saved_search),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}



class SucessRecipes extends StatefulWidget {
  const SucessRecipes({super.key, required this.recipes});

  final List<RecipeModel> recipes;

  @override
  State<SucessRecipes> createState() => _SucessRecipesState();
}

class _SucessRecipesState extends State<SucessRecipes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF3EFEC),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search recipes...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {}, // يفتح الفلاتر
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 10),

        CategoryChips(),

        SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Recipes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("See all"),
                  Icon(Icons.arrow_forward, size: 15),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        Expanded(
          child: widget.recipes.isEmpty
              ? const Emptyscreen()
              : ListView.separated(
                  itemCount: widget.recipes.length,
                  itemBuilder: (context, index) =>
                      RecipesCard(recipeModel: widget.recipes[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                ),
        ),
      ],
    );
  }
}

class Emptyscreen extends StatelessWidget {
  const Emptyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 248, 239, 235),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.search_off, color: Colors.orange, size: 100),
          ),
          const SizedBox(height: 20),
          Text(
            "No recipes found",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              "Check your spelling or try searching for different ingredients.",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<RecipesCubit>().getRecipes();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:  Colors.orange,
              fixedSize:  Size(250, 70),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.close , color: Colors.white, size: 20,),
                Text("clear Search", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class FailureRecipes extends StatelessWidget {
  const FailureRecipes({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 239, 235),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.error, color: Colors.orange, size: 100),
          ),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              "Unable to load recipes right now. Please check your network connection and try again.",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<RecipesCubit>().getRecipes();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:  Colors.orange,
              fixedSize: const Size(300, 70),
            ),
            child: const Text("Retry", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}