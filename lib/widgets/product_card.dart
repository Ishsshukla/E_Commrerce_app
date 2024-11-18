class ProductCard {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  ProductCard({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  // Convert JSON to Product object
  factory ProductCard.fromJson(Map<String, dynamic> json) {
    return ProductCard(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['thumbnail'], // DummyJSON uses "thumbnail" for images
      category: json['category'],
    );
  }

  // Convert Product object to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
    };
  }
}
