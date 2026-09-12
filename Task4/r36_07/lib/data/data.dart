import '../model/food_category.dart';
import '../model/food_item.dart';

List<FoodCategory> categories = [
  FoodCategory(id: 'all', name: 'All'),
  FoodCategory(id: 'combos', name: 'Combos'),
  FoodCategory(id: 'sliders', name: 'Sliders'),
  FoodCategory(id: 'classic', name: 'Classic'),
];

List<FoodItem> foodItems = [
  FoodItem(
    id: 'f1',
    name: 'Cheeseburger',
    subtitle: "Wendy's Burger",
    imageUrl: 'assets/image/burger_1.png',
    rating: 4.9,
    price: 8.24,
    description:
        "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    categoryId: 'classic',
  ),
  FoodItem(
    id: 'f2',
    name: 'Hamburger',
    subtitle: 'Veggie Burger',
    imageUrl: 'assets/image/burger_2.png',
    rating: 4.8,
    price: 7.50,
    description:
        "A delicious veggie burger made with a plant-based patty, fresh lettuce, juicy tomatoes, crunchy onions, and a tangy special sauce. Perfect for those who love a healthier option without sacrificing taste.",
    categoryId: 'classic',
  ),
  FoodItem(
    id: 'f3',
    name: 'Hamburger',
    subtitle: 'Chicken Burger',
    imageUrl: 'assets/image/burger_3.png',
    rating: 4.6,
    price: 9.10,
    description:
        "A tender and crispy chicken burger with a golden fried chicken fillet, fresh greens, sliced pickles, and creamy mayo. Served on a toasted sesame bun for the ultimate crunch.",
    categoryId: 'combos',
  ),
  FoodItem(
    id: 'f4',
    name: 'Hamburger',
    subtitle: 'Fried Chicken Burger',
    imageUrl: 'assets/image/burger_4.png',
    rating: 4.5,
    price: 10.99,
    description:
        "The Fried Chicken Burger features a double stack of seasoned fried chicken patties with melted cheese, fresh lettuce, and our signature spicy sauce. A bold choice for big appetites.",
    categoryId: 'sliders',
  ),
];
