class ProductsModel {
  final List<Products> products;
  final int total;
  final int skip;
  final int limit;

  bool get hasMore => skip + products.length < total;

  ProductsModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products: json['products'] == null
          ? []
          : List<Products>.from(
              json['products'].map((x) => Products.fromJson(x)),
            ),
      total: json['total'] as int? ?? 0,
      skip: json['skip'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (products != null) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Products {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String brand;
  String sku;
  int weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Reviews> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  bool get hasDiscount => discountPercentage > 0;

  double get originalPrice {
    if (!hasDiscount) {
      return price;
    }

    return price / (1 - discountPercentage / 100);
  }

  int get discountPercentageInt => discountPercentage.round();

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      category: json['category'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      tags: json['tags'] == null ? [] : List<String>.from(json['tags']),
      brand: json['brand'] as String? ?? "",
      sku: json['sku'] as String? ?? "",
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      dimensions: Dimensions.fromJson(json['dimensions'] ?? {}),
      warrantyInformation: json['warrantyInformation'] as String? ?? "",
      shippingInformation: json['shippingInformation'] as String? ?? "",
      availabilityStatus: json['availabilityStatus'] as String? ?? "",
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((review) => Reviews.fromJson(review))
          .toList(),
      returnPolicy: json['returnPolicy'] as String? ?? "",
      minimumOrderQuantity:
          (json['minimumOrderQuantity'] as num?)?.toInt() ?? 0,
      meta: Meta.fromJson(json['meta'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class Reviews {
  int rating;
  String comment;
  String date;
  String reviewerName;
  String reviewerEmail;

  Reviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
      date: json['date'] as String? ?? '',
      reviewerName: json['reviewerName'] as String? ?? '',
      reviewerEmail: json['reviewerEmail'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class Meta {
  String createdAt;
  String updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      barcode: json['barcode'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}
