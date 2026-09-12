class RecipesModel {
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  RecipesModel({this.recipes, this.total, this.skip, this.limit});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (recipes != null) {
      data['recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Recipes {
  int id;
  String name;
  List<String> ingredients;
  List<String> instructions;
  int prepTimeMinutes;
  int cookTimeMinutes;
  int servings;
  String difficulty;
  String cuisine;
  int caloriesPerServing;
  List<String> tags;
  int userId;
  String image;
  double rating;
  int reviewCount;
  List<String> mealType;

  Recipes({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      ingredients: json["ingredients"].cast<String>() ?? [],
      instructions: json["instructions"].cast<String>() ?? [],
      prepTimeMinutes: json["prepTimeMinutes"] as int? ?? 0,
      cookTimeMinutes: json["cookTimeMinutes"] as int? ?? 0,
      servings: json["servings"] as int? ?? 0,
      difficulty: json["difficulty"] as String? ?? "",
      cuisine: json["cuisine"] as String? ?? "",
      caloriesPerServing: json["caloriesPerServing"] as int? ?? 0,
      tags: json["tags"].cast<String>() ?? [],
      userId: json["userId"] as int? ?? 0,
      image: json["image"] as String? ?? "",
      rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
      reviewCount: json["reviewCount"] as int? ?? 0,
      mealType: json["mealType"].cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['ingredients'] = ingredients;
    data['instructions'] = instructions;
    data['prepTimeMinutes'] = prepTimeMinutes;
    data['cookTimeMinutes'] = cookTimeMinutes;
    data['servings'] = servings;
    data['difficulty'] = difficulty;
    data['cuisine'] = cuisine;
    data['caloriesPerServing'] = caloriesPerServing;
    data['tags'] = tags;
    data['userId'] = userId;
    data['image'] = image;
    data['rating'] = rating;
    data['reviewCount'] = reviewCount;
    data['mealType'] = mealType;
    return data;
  }
}
