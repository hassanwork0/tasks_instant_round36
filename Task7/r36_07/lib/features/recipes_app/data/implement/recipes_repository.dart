import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';

abstract class RecipesRepository {
  Future<List<ProductModel>> getRecipes();
}
