import '../../../../core/api/api.dart';
import '../model/product_model.dart';

class RecipesRemoteDataSource {
  RecipesRemoteDataSource({Api? api}) : _api = api ?? Api();

  static const String _endPoint = '/recipes';

  final Api _api;

  Future<List<ProductModel>> getRecipes() async {
    final response = await _api.get(_endPoint) as Map<String, dynamic>;
    final recipesJson = response['recipes'] as List<dynamic>? ?? const [];

    return recipesJson
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
