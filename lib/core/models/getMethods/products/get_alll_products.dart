class GetAllProducts {
  List<Product> products;
  int total;
  int skip;
  int limit;

  GetAllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  // fromMap fonksiyonu
  factory GetAllProducts.fromMap(Map<String, dynamic> map) {
    return GetAllProducts(
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      total: map['total']?.toInt() ?? 0,
      skip: map['skip']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
    );
  }

  // toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class Product {
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
  double weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Product({
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

  // fromMap fonksiyonu
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      discountPercentage: map['discountPercentage']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      stock: map['stock']?.toInt() ?? 0,
      tags: List<String>.from(map['tags']),
      brand: map['brand'] ?? '',
      sku: map['sku'] ?? '',
      weight: map['weight']?.toDouble() ?? 0.0,
      dimensions: Dimensions.fromMap(map['dimensions']),
      warrantyInformation: map['warrantyInformation'] ?? '',
      shippingInformation: map['shippingInformation'] ?? '',
      availabilityStatus: map['availabilityStatus'] ?? '',
      reviews: List<Review>.from(map['reviews']?.map((x) => Review.fromMap(x))),
      returnPolicy: map['returnPolicy'] ?? '',
      minimumOrderQuantity: map['minimumOrderQuantity']?.toInt() ?? 0,
      meta: Meta.fromMap(map['meta']),
      images: List<String>.from(map['images']),
      thumbnail: map['thumbnail'] ?? '',
    );
  }

  // toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toMap(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  // fromMap fonksiyonu
  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      depth: map['depth']?.toDouble() ?? 0.0,
    );
  }

  // toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class Review {
  int rating;
  String comment;
  String date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  // fromMap fonksiyonu
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: map['rating']?.toInt() ?? 0,
      comment: map['comment'] ?? '',
      date: map['date'] ?? '',
      reviewerName: map['reviewerName'] ?? '',
      reviewerEmail: map['reviewerEmail'] ?? '',
    );
  }

  // toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
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

  // fromMap fonksiyonu
  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      barcode: map['barcode'] ?? '',
      qrCode: map['qrCode'] ?? '',
    );
  }

  // toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}
