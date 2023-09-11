import 'package:flutter/material.dart';
import 'package:shop_app/util/currency.dart';

class ProductPriceText extends StatelessWidget {
  final double price;

  const ProductPriceText({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      Currency.formatCurrency(amount: price),
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
