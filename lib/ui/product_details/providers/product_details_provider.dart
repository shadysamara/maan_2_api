import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';
import 'package:maan2_api/ui/product_details/data/api_helper.dart';

class ProductDetailsProvider extends ChangeNotifier {
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ProductDetailsApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }
}
