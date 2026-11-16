class ProductModel {
  final List<String> categoryButtons;
  final List<Product> products;

  const ProductModel({required this.categoryButtons, required this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryButtons: List<String>.from(json['categoryButtons'] as List),
      products: (json['products'] as List<dynamic>)
          .map((product) => Product.fromJson(product as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryButtons': categoryButtons,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final int id;
  final String name;
  final String brand;
  final double rating;
  final int deliveryTime;
  final double price;
  final String imagePath;
  final String category;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.rating,
    required this.deliveryTime,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      rating: (json['rating'] as num).toDouble(),
      deliveryTime: json['deliveryTime'] as int,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'rating': rating,
      'deliveryTime': deliveryTime,
      'price': price,
      'imagePath': imagePath,
      'category': category,
      'description': description,
    };
  }
}
