import 'package:flutter/material.dart';

import 'cart_size_text.dart';

class CartBadge extends StatelessWidget {
  final int cartItemSize;

  const CartBadge({super.key, required this.cartItemSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 11,
      top: 7,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
        child: CartSizeText(cartSize: cartItemSize),
      ),
    );
  }
}
