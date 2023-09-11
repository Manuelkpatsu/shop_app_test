import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  final int quantity;

  const QuantityText({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Qty: ${quantity.toString()}',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
