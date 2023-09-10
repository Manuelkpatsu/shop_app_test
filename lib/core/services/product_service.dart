import 'dart:convert';
import 'dart:io';
import 'package:shop_app/core/exceptions/failure.dart';
import 'package:shop_app/core/model/product.dart';
import 'package:shop_app/util/constants.dart';

import 'http_service.dart';

class ProductService extends HttpService {
  Future<List<Product>> getProducts() async {
    try {
      final response = await get(Api.products);

      if (isSuccessful(response)) {
        final data = json.decode(response.body);
        return List<Product>.from(data.map((i) => Product.fromJson(i)));
      }
      throw ServerFailure(
        statusCode: response.statusCode,
        message: "Sorry!, an error occured!",
      );
    } on SocketException {
      throw const NetworkFailure();
    } on FormatException {
      throw const FormatFailure();
    } catch (e) {
      rethrow;
    }
  }
}
