import 'package:flutter/material.dart';

class CartSizeText extends StatelessWidget {
  final int cartSize;

  const CartSizeText({super.key, required this.cartSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$cartSize',
      style: const TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
