class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double? oldPrice;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.rating,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  int get discountPercentage {
    if (!hasDiscount || oldPrice == null) return 0;
    return ((oldPrice! - price) / oldPrice! * 100).round();
  }
}
