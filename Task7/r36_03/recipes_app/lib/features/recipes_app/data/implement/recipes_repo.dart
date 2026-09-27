import 'package:recipes_app/features/recipes_app/data/model/product_model.dart';
import 'package:recipes_app/features/recipes_app/data/source/recipes_remote_data_source.dart';

abstract class RecipesRepository {
  Future<List<ProductModel>> getRecipes();
}

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;

  RecipesRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductModel>> getRecipes() async {
    return await remoteDataSource.getRecipes();
  }
}
