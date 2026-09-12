import 'package:recipes_app/features/home/data/data_sources/remote_data_source.dart';
import 'package:recipes_app/features/home/data/models/recipes_model.dart';

class HomeRepo {
  RemoteDataSource _remote;

  HomeRepo(this._remote);

  Future<RecipesModel> getRecipes() async {
    final recipesModel = await _remote.recipes();

    return recipesModel;
  }
}
