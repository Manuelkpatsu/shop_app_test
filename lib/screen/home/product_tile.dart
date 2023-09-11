import 'package:flutter/material.dart';
import 'package:shop_app/core/model/product.dart';

import '../widget/product_image.dart';
import '../widget/product_name_text.dart';
import '../widget/product_price_text.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onPressed;

  const ProductTile({
    super.key,
    required this.product,
    required this.onAddToCartPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
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
                      Row(
                        children: <Widget>[
                          ProductPriceText(price: product.price.toDouble()),
                          const SizedBox(width: 5),
                          IconButton(
                            splashRadius: 20,
                            icon: const Icon(Icons.add_shopping_cart),
                            color: Colors.grey,
                            onPressed: onAddToCartPressed,
                          ),
                        ],
                      ),
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
      ),
    );
  }
}
