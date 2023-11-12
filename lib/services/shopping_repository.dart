// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../consts/constants.dart';
import '../models/product.dart';

class ShoppingRepository {
  final _dio = Dio();
  var getProductsUrl = '$BASE_URL/products.json';

  Future<List<Product>> getProducts() async {
    var params = {"brand": "maybelline"};
    try {
      Response response =
          await _dio.get(getProductsUrl, queryParameters: params);
      List<Product> products = (response.data as List).map((i) {
        return Product.fromJson(i);
      }).toList();
      return products;
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }
}
