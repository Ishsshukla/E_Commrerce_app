class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String sku;
  final String imageUrl;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.sku,
    required this.imageUrl,
    required this.thumbnail,
  });

  // Factory constructor for creating Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price']?.toDouble() ?? 0.0,
      discountPercentage: json['discountPercentage']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      brand: json['brand'],
      sku: json['sku'],
      imageUrl: (json['images'] as List).isNotEmpty ? json['images'][0] : '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  // Method for converting Product to Map (e.g., for SQLite)
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
      'brand': brand,
      'sku': sku,
      'imageUrl': imageUrl,
      'thumbnail': thumbnail,
    };
  }

  // Factory constructor for creating Product from Map (e.g., from SQLite)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      discountPercentage: map['discountPercentage'],
      rating: map['rating'],
      stock: map['stock'],
      brand: map['brand'],
      sku: map['sku'],
      imageUrl: map['imageUrl'],
      thumbnail: map['thumbnail'],
    );
  }
}
