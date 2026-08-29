import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.difficulty,
    required this.rating,
    required this.reviewCount,
    required this.tags,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.mealType,
  });

  final int id;
  final String name;
  final String image;
  final String difficulty;
  final double rating;
  final int reviewCount;
  final List<String> tags;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> mealType;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      tags: List<String>.from(json['tags'] ?? const []),
      ingredients: List<String>.from(json['ingredients'] ?? const []),
      instructions: List<String>.from(json['instructions'] ?? const []),
      prepTimeMinutes: json['prepTimeMinutes'] as int? ?? 0,
      cookTimeMinutes: json['cookTimeMinutes'] as int? ?? 0,
      servings: json['servings'] as int? ?? 0,
      cuisine: json['cuisine'] as String? ?? '',
      caloriesPerServing: json['caloriesPerServing'] as int? ?? 0,
      mealType: List<String>.from(json['mealType'] ?? const []),
    );
  }

  @override
  List<Object?> get props => [id];
}
