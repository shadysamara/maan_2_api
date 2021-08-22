import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/data/api_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllProducts();
  }
  List<AllProductsResponse> allProducts;
  getAllProducts() async {
    allProducts = await HomeApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }
}
