import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/enums/view_state.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/core/view_models/cart_vm.dart';
import 'package:shop_app/core/view_models/product_vm.dart';
import 'package:shop_app/screen/cart/cart_screen.dart';

import 'product_tile.dart';
import 'widget/cart_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProductVM>().getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productVM = Provider.of<ProductVM>(context);
    final cartVM = Provider.of<CartVM>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                splashColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              cartVM.cartSize != 0
                  ? CartBadge(cartItemSize: cartVM.cartSize)
                  : const SizedBox.shrink()
            ],
          )
        ],
      ),
      body: productVM.state == ViewState.busy
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                Product product = productVM.products[index];

                return ProductTile(
                  product: product,
                  onPressed: () {},
                  onAddToCartPressed: () => context.read<CartVM>().addToCart(product),
                );
              },
              itemCount: productVM.products.length,
            ),
    );
  }
}
