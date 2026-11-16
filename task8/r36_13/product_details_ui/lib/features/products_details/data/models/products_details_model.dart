class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String>? tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Reviews>? reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: (json["id"] as num? ?? 0).toInt(),
      title: json["title"] as String? ?? "",
      description: json["description"] as String? ?? "",
      category: json["category"] as String? ?? "",
      price: (json["price"] as num? ?? 0).toDouble(),
      discountPercentage:(json["discountPercentage"] as num? ?? 0).toDouble() ,
      rating: (json["rating"] as num? ?? 0).toDouble(),
      stock: (json["stock"] as num? ?? 0).toInt() ,
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]),
      brand: json["brand"] as String? ?? "",
      sku: json["sku"] as String? ?? "",
      weight: (json["weight"] as num? ?? 0).toInt() ,
      dimensions: Dimensions.fromJson(json["dimensions"] ?? {}), 
      warrantyInformation: json["warrantyInformation"] as String? ?? "",
      shippingInformation: json["shippingInformation"] as String? ?? "",
      availabilityStatus: json["availabilityStatus"] as String? ?? "",
      reviews: (json["reviews"] as List<dynamic>? ?? [])
                .map((e) => Reviews.fromJson(e))
                .toList(),
      returnPolicy: json["returnPolicy"] as String? ?? "",
      minimumOrderQuantity:(json["minimumOrderQuantity"] as num? ?? 0).toInt() ,
      meta: Meta.fromJson(json["meta"] ?? {}),
      images:List<String>.from(json["images"] ?? []),
      thumbnail: json["thumbnail"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["category"] = category;
    data["price"] = price;
    data["discountPercentage"] = discountPercentage;
    data["rating"] = rating;
    data["stock"] = stock;
    if (tags != null) {
      data["tags"] = tags;
    }
    data["brand"] = brand;
    data["sku"] = sku;
    data["weight"] = weight;
    if (dimensions != null) {
      data["dimensions"] = dimensions!.toJson();
    }
    data["warrantyInformation"] = warrantyInformation;
    data["shippingInformation"] = shippingInformation;
    data["availabilityStatus"] = availabilityStatus;
    if (reviews != null) {
      data["reviews"] = reviews!.map((e) => e.toJson()).toList();
    }
    data["returnPolicy"] = returnPolicy;
    data["minimumOrderQuantity"] = minimumOrderQuantity;
    if (meta != null) {
      data["meta"] = meta!.toJson();
    }
    if (images.isNotEmpty) {
      data["images"] = images;
    }
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({required this.createdAt, required this.updatedAt, required this.barcode, required this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json["createdAt"] ?? "" ,
      updatedAt: json["updatedAt"] ?? "" ,
      barcode: json["barcode"] ?? "" ,
      qrCode: json["qrCode"] ?? "" ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["barcode"] = barcode;
    data["qrCode"] = qrCode;
    return data;
  }
}

class Reviews {
 final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Reviews({
   required this.rating,
   required this.comment,
   required this.date,
   required this.reviewerName,
   required this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      rating: (json["rating"] as num? ?? 0).toInt() ,
      comment: json["comment"] ?? "" ,
      date: json["date"] ?? "",
      reviewerName: json["reviewerName"] ?? "" ,
      reviewerEmail: json["reviewerEmail"] ?? "" ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rating"] = rating;
    data["comment"] = comment;
    data["date"] = date;
    data["reviewerName"] = reviewerName;
    data["reviewerEmail"] = reviewerEmail;
    return data;
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json["width"] as num? ?? 0).toDouble() ,
      height: (json["height"] as num? ?? 0).toDouble(),
      depth: (json["depth"] as num? ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["width"] = width;
    data["height"] = height;
    data["depth"] = depth;
    return data;
  }
}
