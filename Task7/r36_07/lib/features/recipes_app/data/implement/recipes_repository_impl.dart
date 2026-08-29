import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';

import '../source/recipes_remote_data_source.dart';
import 'recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl({RecipesRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? RecipesRemoteDataSource();

  final RecipesRemoteDataSource _remoteDataSource;

  @override
  Future<List<ProductModel>> getRecipes() {
    return _remoteDataSource.getRecipes();
  }
}
