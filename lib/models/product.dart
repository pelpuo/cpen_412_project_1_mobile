class Product {
  int? id;
  final String name;
  final double price;
  final int quantity;
  String? imageUrl;

  Product(
      {required this.name,
      required this.price,
      required this.quantity,
      this.id,
      this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      imageUrl: json['image_url'],
    );
  }
}
