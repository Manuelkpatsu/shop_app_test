import 'package:shop_app/core/enums/view_state.dart';
import 'package:shop_app/core/locator.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/core/services/product_service.dart';

import 'base_vm.dart';

class ProductVM extends BaseVM {
  final ProductService _productService = sl<ProductService>();

  List<Product> _products = <Product>[];

  List<Product> get products => _products;

  Future getProducts() async {
    applyState(ViewState.busy);
    try {
      _products = await _productService.getProducts();
    } catch (e) {
      rethrow;
    } finally {
      applyState(ViewState.idle);
    }
  }
}
