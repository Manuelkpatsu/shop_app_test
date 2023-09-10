import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'view_models/cart_vm.dart';
import 'view_models/product_vm.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ProductVM>(create: (context) => ProductVM()),
  ChangeNotifierProvider<CartVM>(create: (context) => CartVM())
];
