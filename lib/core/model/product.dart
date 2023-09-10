import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final int price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        price = json['price'] as int,
        imageUrl = json['imageUrl'] as String;

  @override
  List<Object?> get props => [id, name, price, imageUrl];
}
