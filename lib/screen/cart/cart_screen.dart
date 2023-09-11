import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/core/view_models/cart_vm.dart';
import 'package:shop_app/screen/widget/dialogs/confirmation_dialog.dart';
import 'package:shop_app/screen/widget/dialogs/confirmed_dialog.dart';

import 'cart_item_tile.dart';
import 'widget/cart_text.dart';
import 'widget/confirm_cart_button.dart';
import 'widget/empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = Provider.of<CartVM>(context);

    return Scaffold(
      appBar: AppBar(
        title: const CartText(),
        actions: [
          cartVM.cartSize > 0
              ? ConfirmCartButton(
                  onPressed: () {
                    showConfirmationDialog(
                      context: context,
                      totalCost: cartVM.totalCost.toDouble(),
                    ).then((shouldConfirmOrder) {
                      if (shouldConfirmOrder) {
                        showConfirmedDialog(context: context)
                            .then((isConfirmed) {
                          cartVM.clearCart();
                        });
                      }
                    });
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
      body: cartVM.cartSize > 0
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                Product product = cartVM.getProduct(index);

                return CartItemTile(
                  product: product,
                  quantity: cartVM.getProductQuantity(index),
                );
              },
              itemCount: cartVM.getCartSummary().keys.length,
            )
          : const EmptyStateWidget(info: 'Your cart is empty'),
    );
  }
}
