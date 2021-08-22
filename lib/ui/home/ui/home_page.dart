import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/data/api_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';
import 'package:maan2_api/ui/home/providers/home_provider.dart';
import 'package:maan2_api/ui/home/ui/widgets/category_widget.dart';
import 'package:maan2_api/ui/home/ui/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, x) {
          List<AllProductsResponse> products = provider.allProducts;
          if (products == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  provider.allCategories == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: provider.allCategories.map((e) {
                              return CategoryWidget(e);
                            }).toList(),
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'All Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductWidget(products[index]);
                        }),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
