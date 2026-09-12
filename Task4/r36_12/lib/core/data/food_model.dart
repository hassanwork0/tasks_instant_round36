class FoodModel {
  List<String>? categoryButtons;
  List<Products>? products;

  FoodModel({this.categoryButtons, this.products});

  FoodModel.fromJson(Map<String, dynamic> json) {
    categoryButtons = json['categoryButtons'].cast<String>();
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryButtons'] = this.categoryButtons;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? brand;
  double? rating;
  int? deliveryTime;
  double? price;
  String? imagePath;
  String? category;
  String? description;

  Products({
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

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      rating: json['rating'] as double,
      deliveryTime: json['deliveryTime'] as int,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['rating'] = this.rating;
    data['deliveryTime'] = this.deliveryTime;
    data['price'] = this.price;
    data['imagePath'] = this.imagePath;
    data['category'] = this.category;
    data['description'] = this.description;
    return data;
  }
}
