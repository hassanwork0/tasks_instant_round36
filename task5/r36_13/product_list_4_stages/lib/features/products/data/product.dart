class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double? oldPrice;
  final String image;
  final String category;
  final double rating;
  final int reviewsCount;
  final bool isAvailable;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.image,
    required this.category,
    this.rating = 0,
    this.reviewsCount = 0,
    this.isAvailable = true,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  double get discountPercentage =>
      hasDiscount ? ((oldPrice! - price) / oldPrice!) * 100 : 0;

  int get discountPercentageInt =>  discountPercentage.round();

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    price: (json['price'] as num).toDouble(),
    oldPrice: (json['old_price'] as num?)?.toDouble(),
    image: json['image'] as String,
    category: json['category'] as String,
    rating: (json['rating'] as num?)?.toDouble() ?? 0,
    reviewsCount: json['reviews_count'] as int? ?? 0,
    isAvailable: json['is_available'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'old_price': oldPrice,
    'image': image,
    'category': category,
    'rating': rating,
    'reviews_count': reviewsCount,
    'is_available': isAvailable,
  };

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? oldPrice,
    String? image,
    String? category,
    double? rating,
    int? reviewsCount,
    bool? isAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      image: image ?? this.image,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
