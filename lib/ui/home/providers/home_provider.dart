import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/data/api_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllProducts();
    getAllCategories();
  }

  List<String> names = ['ola', 'hadeel', 'ruba'];
  List<AllProductsResponse> allProducts;
  List<AllProductsResponse> categoryProducts;
  List<dynamic> allCategories;

  String selectedCategory;
  getAllProducts() async {
    allProducts = await HomeApiHelper.apiHelper.getAllProducts();
    allProducts.shuffle();
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await HomeApiHelper.apiHelper.getAllCategories();
    this.selectedCategory = allCategories.first.toString();
    getAllProductsInCategory();
    notifyListeners();
  }

  selectCategory(String categoryName) {
    this.categoryProducts = null;
    this.selectedCategory = categoryName;
    notifyListeners();
    getAllProductsInCategory();
  }

  getAllProductsInCategory() async {
    categoryProducts = await HomeApiHelper.apiHelper
        .getAllProductsInCategory(selectedCategory);
    notifyListeners();
  }
}
