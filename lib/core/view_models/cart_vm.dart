import 'package:shop_app/core/model/product.dart';

import 'base_vm.dart';

class CartVM extends BaseVM {
  List<Product> cart = [];
  Map<String, List<Product>> cartSummary = {};

  int get cartSize => cart.length;

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  List<Product> getCart() => cart;

  Map<String, List<Product>> getCartSummary() {
    cartSummary = {};
    for (final product in cart) {
      if (!cartSummary.keys.contains(product.name)) {
        cartSummary[product.name] = [product];
      } else {
        final currentProducts = cartSummary[product.name];
        if (currentProducts != null) {
          currentProducts.add(product);
          cartSummary[product.name] = currentProducts;
        }
      }
    }
    return cartSummary;
  }

  Product getProduct(int index) {
    final name = cartSummary.keys.elementAt(index);
    return cartSummary[name]!.first;
  }

  int getProductQuantity(int index) {
    final name = cartSummary.keys.elementAt(index);
    return cartSummary[name]!.length;
  }

  int get totalCost {
    var cost = 0;
    for (final productName in cartSummary.keys) {
      cost += (cartSummary[productName]!.first.price *
          cartSummary[productName]!.length);
    }
    return cost;
  }

  void clearCart() {
    cart = [];
    notifyListeners();
  }
}
