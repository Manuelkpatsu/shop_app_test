import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;
  final String brand;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.brand,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title'],
        price = json['price'],
        imageUrl = json['thumbnail'],
        description = json['description'],
        brand = json['brand'];

  @override
  List<Object?> get props => [id, name, price, imageUrl, description, brand];
}
