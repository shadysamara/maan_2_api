import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';

class HomeApiHelper {
  HomeApiHelper._() {
    dio = Dio();
  }
  static HomeApiHelper apiHelper = HomeApiHelper._();
  Dio dio;

  Future<List<AllProductsResponse>> getAllProducts(
      [int limit = 20, sort = 'desc']) async {
    String url = 'https://fakestoreapi.com/products?limit=$limit';
    Response response = await dio.get(url);

    List responses = response.data;
    List<AllProductsResponse> allProductsResponses =
        responses.map((e) => AllProductsResponse.fromJson(e)).toList();
    return allProductsResponses;
  }

  getAllCategories() async {}
}
