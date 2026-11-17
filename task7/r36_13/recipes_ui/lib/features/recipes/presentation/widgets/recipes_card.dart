import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipes_ui/core/routing/routes.dart';
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';

class RecipesCard extends StatelessWidget {
  const RecipesCard({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => context.push(
            Routes.recipeDetails,
            extra: recipeModel,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    recipeModel.image ,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${recipeModel.name}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "${recipeModel.rating}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        Text(
                          "${recipeModel.cookTimeMinutes} min",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 10,
                          height: 10,
                        ),
                        Text(
                          "${recipeModel.cuisine}",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 10,
                          height: 10,
                        ),
                        Text(
                          "${recipeModel.difficulty}",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
