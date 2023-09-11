import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/core/view_models/cart_vm.dart';

List<Product> mockProducts = [
  const Product(
    id: 1,
    name: 'iPhone 9',
    price: 549,
    imageUrl: 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
    description: 'An apple mobile which is nothing like apple',
    brand: 'Apple',
  ),
  const Product(
    id: 2,
    name: 'iPhone X',
    price: 899,
    imageUrl: 'https://i.dummyjson.com/data/products/2/thumbnail.jpg',
    description:
        'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...',
    brand: 'Apple',
  ),
  const Product(
    id: 3,
    name: 'Samsung Universe 9',
    price: 1249,
    imageUrl: 'https://i.dummyjson.com/data/products/3/thumbnail.jpg',
    description:
        'Samsung\'s new variant which goes beyond Galaxy to the Universe',
    brand: 'Samsung',
  ),
  const Product(
    id: 4,
    name: 'MacBook Pro',
    price: 1749,
    imageUrl: 'https://i.dummyjson.com/data/products/6/thumbnail.png',
    description:
        'MacBook Pro 2021 with mini-LED display may launch between September, November',
    brand: 'Apple',
  ),
];

void main() {
  final cartVM = CartVM();

  cartVM.addToCart(mockProducts[0]);
  cartVM.addToCart(mockProducts[1]);
  cartVM.addToCart(mockProducts[2]);
  cartVM.addToCart(mockProducts[3]);
  cartVM.addToCart(mockProducts[0]);
  cartVM.addToCart(mockProducts[1]);

  group(
    "Unit Tests on CartVM",
    () {
      test(
        "page should load list of products added to cart",
        () async {
          expect(cartVM.cartSize, 6);
          expect(cartVM.getCartSummary().keys.length, 4);
        },
      );

      test(
        """page should consolidate products in cart and
        show accurate summary data""",
        () {
          cartVM.getCartSummary();
          expect(cartVM.getProduct(0).id, 1);
          expect(cartVM.getProduct(1).id, 2);
          expect(cartVM.getProduct(2).id, 3);
          expect(cartVM.getProduct(3).id, 4);

          expect(cartVM.getProductQuantity(0), 2);
          expect(cartVM.getProductQuantity(1), 2);
          expect(cartVM.getProductQuantity(2), 1);
          expect(cartVM.getProductQuantity(3), 1);
        },
      );

      test(
        "when user confirms the purchase, it should show total costs",
        () {
          expect(cartVM.totalCost, 5894);
        },
      );

      test(
        "when user has finished the purchase, it should clear the cart",
        () {
          cartVM.clearCart();
          expect(cartVM.cartSize, 0);
        },
      );

      test(
        "when user adds first product to cart, there should be only one cart item",
        () {
          cartVM.addToCart(mockProducts[0]);
          expect((cartVM.cartSize), 1);
        },
      );
    },
  );
}
