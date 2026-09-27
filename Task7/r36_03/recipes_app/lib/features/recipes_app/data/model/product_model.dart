class ProductModel {
  final int id;
  final String name;
  final String image;
  final String difficulty;
  final double rating;
  final List<String> ingredients;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.difficulty,
    required this.rating,
    required this.ingredients,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      difficulty: json['difficulty'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ingredients: List<String>.from(json['ingredients'] ?? []),
    );
  }
}
