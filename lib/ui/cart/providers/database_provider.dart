import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maan2_api/helpers/custom_dialoug.dart';
import 'package:maan2_api/ui/cart/data/sqflite_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';

class DatabaseProvider extends ChangeNotifier {
  List<AllProductsResponse> favouriteProdcts;
  List<AllProductsResponse> cartProdcts;
  getAllProductsInCart() async {
    List<Map<String, Object>> carts = await DbHelper.cartDbHelper.getCart();
    cartProdcts = carts.map((e) {
      dynamic productMap = json.decode(e[DbHelper.productDetailsColumn]);
      return AllProductsResponse.fromJson(productMap);
    }).toList();
    notifyListeners();
  }

  getAllProductsInFavourite() async {}
  insertProductInCart(AllProductsResponse allProductsResponse) async {
    String product = json.encode(allProductsResponse.toJson());
    await DbHelper.cartDbHelper.addToCart(product, allProductsResponse.id);
    getAllProductsInCart();
  }

  insertProductInFavourite() async {}
  deleteProductInCart(int id) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        'You will delete this product from cart, are you sure',
        'Alert',
        excuteDeltet,
        id);
  }

  excuteDeltet(int id) async {
    await DbHelper.cartDbHelper.removeFromCart(id);
    getAllProductsInCart();
  }

  deleteProductInFavourite() async {}
}
