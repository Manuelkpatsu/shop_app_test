import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shop_app/core/enums/view_state.dart';
import 'package:shop_app/core/locator.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/core/services/product_service.dart';
import 'package:shop_app/core/view_models/product_vm.dart';

class MockProductService extends Mock implements ProductService {}

final List<Product> products = [
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
];

void main() {
  setUpLocator();

  final productVM = ProductVM();
  final mockProductService = MockProductService();
  productVM.productService = mockProductService;

  group(
    'Unit Tests on ProductVM',
    () {
      void getProductsFromService() {
        when(() => mockProductService.getProducts()).thenAnswer(
          (_) async => products,
        );
      }

      test(
        "gets products using the ProductService",
        () async {
          getProductsFromService();
          await productVM.getProducts();
          verify(() => mockProductService.getProducts()).called(1);
        },
      );

      test(
        """indicates loading of data,
        sets products to the ones from the service,
        indicates that the data is not being loaded anymore""",
        () async {
          getProductsFromService();
          final future = productVM.getProducts();
          expect(productVM.state, ViewState.busy);
          await future;
          expect(productVM.products, products);
          expect(productVM.state, ViewState.idle);
        },
      );

      test(
        'page should load a list of products from dummyJSON',
        () async {
          getProductsFromService();
          final future = productVM.getProducts();
          await future;
          expect(productVM.products.length, 3);
          expect(productVM.products[0].name, 'iPhone 9');
          expect(productVM.products[0].price, 549);
          expect(productVM.products[1].name, 'iPhone X');
          expect(productVM.products[1].price, 899);
        },
      );
    },
  );
}
