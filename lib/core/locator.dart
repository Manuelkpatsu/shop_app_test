import 'package:get_it/get_it.dart';

import 'services/product_service.dart';
import 'view_models/cart_vm.dart';
import 'view_models/product_vm.dart';

GetIt sl = GetIt.instance;

void setUpLocator() {
  sl.registerLazySingleton(() => ProductService());
  sl.registerFactory(() => ProductVM());
  sl.registerFactory(() => CartVM());
}
