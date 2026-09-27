class AUDToCartModel {
  final int id;
  final List<AddCartProductModel> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  AUDToCartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory AUDToCartModel.fromJson(Map<String, dynamic> json) => AUDToCartModel(
    id: (json["id"] as num?)?.toInt() ?? 0,
    products: json["products"] == null
        ? []
        : List<AddCartProductModel>.from(
            json["products"].map((x) => AddCartProductModel.fromJson(x)),
          ),
    total: (json["total"] as num?)?.toDouble() ?? 0.0,
    discountedTotal: (json["discountedTotal"] as num?)?.toDouble() ?? 0.0,
    userId: (json["userId"] as num?)?.toInt() ?? 0,
    totalProducts: json["totalProducts"] as int? ?? 0,
    totalQuantity: json["totalQuantity"] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "discountedTotal": discountedTotal,
    "userId": userId,
    "totalProducts": totalProducts,
    "totalQuantity": totalQuantity,
  };
}

class AddCartProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedPrice;
  final String thumbnail;

  AddCartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  factory AddCartProductModel.fromJson(Map<String, dynamic> json) =>
      AddCartProductModel(
        id: (json["id"] as num?)?.toInt() ?? 0,
        title: json["title"] as String? ?? "",
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
        quantity: json["quantity"] as int? ?? 0,
        total: (json["total"] as num?)?.toDouble() ?? 0.0,
        discountPercentage:
            (json["discountPercentage"] as num?)?.toDouble() ?? 0.0,
        discountedPrice: (json["discountedPrice"] as num?)?.toDouble() ?? 0.0,
        thumbnail: json["thumbnail"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedTotal": discountedPrice,
    "thumbnail": thumbnail,
  };
}
