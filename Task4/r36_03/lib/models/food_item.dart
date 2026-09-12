class FoodItem {
  final String id;
  final String name;
  final String brand;
  final double rating;
  final String deliveryTime;
  final double price;
  final String imagePath;
  final String category;
  final String description;
  final String spiciness;
  final String portion;

  const FoodItem({
    required this.id,
    required this.name,
    required this.brand,
    required this.rating,
    required this.deliveryTime,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.spiciness,
    required this.portion,
  });
}

List<FoodItem> dummyFoodItems = [
  const FoodItem(
    id: '1',
    name: 'Cheeseburger',
    brand: "Wendy's Burger",
    rating: 4.9,
    deliveryTime: '26 mins',
    price: 8.24,
    imagePath: 'https://www.pngmart.com/files/1/Burger-PNG.png',
    category: 'Beef',
    description:
        "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite.",
    spiciness: 'Mild',
    portion: 'Hamburger',
  ),
  const FoodItem(
    id: '2',
    name: 'Veggie Burger',
    brand: "Veggie Burger",
    rating: 4.9,
    deliveryTime: '20 mins',
    price: 7.99,
    imagePath: 'https://www.pngmart.com/files/1/Burger-Food-PNG.png',
    category: 'Beef',
    description:
        "A delicious plant-based alternative packed with fresh vegetables and flavorful spices.",
    spiciness: 'Mild',
    portion: 'Hamburger',
  ),
  const FoodItem(
    id: '3',
    name: 'Hamburger',
    brand: "Classic Burger",
    rating: 4.8,
    deliveryTime: '15 mins',
    price: 6.99,
    imagePath:
        'https://www.pngmart.com/files/5/Hamburger-PNG-Free-Download.png',
    category: 'Beef',
    description:
        "Our classic hamburger made with 100% pure beef and fresh ingredients.",
    spiciness: 'Mild',
    portion: 'Hamburger',
  ),
  const FoodItem(
    id: '4',
    name: 'Chicken Burger',
    brand: "Chicken Burger",
    rating: 4.6,
    deliveryTime: '22 mins',
    price: 7.49,
    imagePath: 'https://www.pngmart.com/files/5/Hamburger-PNG-HD.png',
    category: 'Chicken',
    description:
        "Grilled chicken breast with fresh lettuce and our special sauce.",
    spiciness: 'Mild',
    portion: 'Hamburger',
  ),
  const FoodItem(
    id: '5',
    name: 'Fried Chicken Burger',
    brand: "Fried Chicken Burger",
    rating: 4.5,
    deliveryTime: '25 mins',
    price: 8.24,
    imagePath: 'https://www.pngmart.com/files/5/Hamburger-PNG-Image.png',
    category: 'Chicken',
    description: "Crispy fried chicken topped with cheese and spicy mayo.",
    spiciness: 'Spicy',
    portion: 'Hamburger',
  ),
];
