import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/data/api_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllProducts();
    getAllCategories();
  }
  List<AllProductsResponse> allProducts;
  List<dynamic> allCategories;
  getAllProducts() async {
    allProducts = await HomeApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await HomeApiHelper.apiHelper.getAllCategories();
    notifyListeners();
  }
}
