
import 'package:recipes_ui/features/recipes/data/models/recipes_model.dart';
import 'package:recipes_ui/features/recipes/data/remote_datasource/remote_data_source.dart';

class RecipesRepo {
  final RemoteDataSource _remoteDataSource;

  RecipesRepo(this._remoteDataSource);

  Future<List<RecipeModel>> getRecipes() async {
    return _remoteDataSource.recipes();
  }
}
