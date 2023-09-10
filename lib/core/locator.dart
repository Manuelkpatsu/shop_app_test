import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'services/product_service.dart';

GetIt sl = GetIt.instance;

void setUpLocator() {
  sl.registerFactory(() => Logger());
  sl.registerLazySingleton(() => ProductService());
}
