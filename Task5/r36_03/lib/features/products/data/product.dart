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

  String get discountPercentageText => discountPercentage.toStringAsFixed(0);

  int get discountPercentageInt => discountPercentage.round();
}
