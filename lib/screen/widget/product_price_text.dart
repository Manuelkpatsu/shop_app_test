import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final double price;

  const ProductPriceText({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
