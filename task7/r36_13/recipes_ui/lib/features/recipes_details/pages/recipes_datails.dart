import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipes_ui/core/routing/routes.dart';
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final RecipeModel recipe;

  RecipeDetailsScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  final Set<int> selectedIngredients = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recipes", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.bookmark_outline, color: Colors.orange),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.recipe.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20),
              Text(
                widget.recipe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 15, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        '${widget.recipe.rating} (${widget.recipe.reviewCount} reviews)',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, size: 15, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '${widget.recipe.prepTimeMinutes + widget.recipe.cookTimeMinutes} mins',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.restaurant, size: 15, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        widget.recipe.difficulty,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.people_outline, size: 15, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '${widget.recipe.servings} servings',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 239, 236),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${widget.recipe.ingredients.length} items',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 12) / 2;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      for (
                        var index = 0;
                        index < widget.recipe.ingredients.length;
                        index++
                      )
                        SizedBox(
                          width: itemWidth,
                          child: Container(
                            constraints: BoxConstraints(minHeight: 58),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color.fromARGB(255, 240, 237, 234),
                              ),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedIngredients.contains(index)) {
                                        selectedIngredients.remove(index);
                                      } else {
                                        selectedIngredients.add(index);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedIngredients.contains(index)
                                          ? Colors.orange
                                          : Colors.transparent,
                                      border: Border.all(color: Colors.orange),
                                    ),
                                    child: selectedIngredients.contains(index)
                                        ? Icon(
                                            Icons.check,
                                            size: 14,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    widget.recipe.ingredients[index],
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 239, 236),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${widget.recipe.instructions.length} steps',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              for (
                var index = 0;
                index < widget.recipe.instructions.length;
                index++
              ) ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color.fromARGB(255, 240, 237, 234),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: Color.fromARGB(255, 255, 238, 229),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(child: Text(widget.recipe.instructions[index])),
                    ],
                  ),
                ),
                if (index < widget.recipe.instructions.length - 1)
                  SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                context.push(Routes.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: Text("Start Cooking"),
            ),
          ),
        ),
      ),
    );
  }
}
