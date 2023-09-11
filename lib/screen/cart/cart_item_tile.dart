import 'package:flutter/material.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/screen/widget/product_image.dart';
import 'package:shop_app/screen/widget/product_name_text.dart';
import 'package:shop_app/screen/widget/product_price_text.dart';

import 'widget/quantity_text.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  
  const CartItemTile({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: const Offset(0, 15),
              blurRadius: 60,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductNameText(name: product.name),
                    ProductPriceText(price: product.price.toDouble()),
                    QuantityText(quantity: quantity),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              const VerticalDivider(color: Colors.grey, thickness: 0.2),
              const SizedBox(width: 5),
              ProductImage(imageUrl: product.imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
