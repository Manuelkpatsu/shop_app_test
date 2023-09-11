import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 90.0,
      width: 135.0,
      fit: BoxFit.contain,
    );
  }
}
