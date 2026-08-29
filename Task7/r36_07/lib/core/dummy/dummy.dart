import '../../features/recipes_app/data/model/product_model.dart';

class DummyData {
  static const List<ProductModel> recipes = [
    ProductModel(
      id: 1,
      name: 'Classic Margherita Pizza',
      image: 'https://cdn.dummyjson.com/recipe-images/1.webp',
      difficulty: 'Easy',
      rating: 4.6,
      reviewCount: 98,
      tags: ['Pizza', 'Italian'],
      ingredients: [
        'Pizza dough',
        'Tomato sauce',
        'Fresh mozzarella cheese',
        'Fresh basil leaves',
        'Olive oil',
      ],
      instructions: [
        'Preheat the oven to 475°F (245°C).',
        'Roll out the pizza dough and spread tomato sauce evenly.',
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 15,
      servings: 4,
      cuisine: 'Italian',
      caloriesPerServing: 300,
      mealType: ['Dinner'],
    ),
    ProductModel(
      id: 2,
      name: 'Spaghetti Carbonara',
      image: 'https://cdn.dummyjson.com/recipe-images/2.webp',
      difficulty: 'Medium',
      rating: 4.8,
      reviewCount: 156,
      tags: ['Pasta', 'Italian'],
      ingredients: [
        'Spaghetti',
        'Eggs',
        'Pancetta',
        'Parmesan cheese',
        'Black pepper',
      ],
      instructions: [
        'Cook spaghetti according to package instructions.',
        'Mix eggs and grated parmesan cheese in a bowl.',
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 20,
      servings: 2,
      cuisine: 'Italian',
      caloriesPerServing: 520,
      mealType: ['Dinner'],
    ),
  ];
}
