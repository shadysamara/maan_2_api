import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maan2_api/ui/cart/ui/cart_page.dart';
import 'package:maan2_api/ui/cart/ui/favourite_page.dart';
import 'package:maan2_api/ui/home/data/api_helper.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';
import 'package:maan2_api/ui/home/providers/home_provider.dart';
import 'package:maan2_api/ui/home/ui/widgets/category_widget.dart';
import 'package:maan2_api/ui/home/ui/widgets/product_widget.dart';
import 'package:maan2_api/ui/product_details/providers/product_details_provider.dart';
import 'package:maan2_api/ui/product_details/ui/product_details.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CartPage();
                }));
              },
              icon: Icon(Icons.shopping_bag)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FavouritePage();
                }));
              },
              icon: Icon(Icons.favorite)),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, x) {
          List<AllProductsResponse> allProducts = provider.allProducts;

          List<AllProductsResponse> products = provider.categoryProducts;
          List<dynamic> categories = provider.allCategories;

          return Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                allProducts == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CarouselSlider(
                        options: CarouselOptions(height: 200.0),
                        items: allProducts.take(4).map((element) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: CachedNetworkImage(
                                      imageUrl: element.image));
                            },
                          );
                        }).toList(),
                      ),
                Text(
                  'All Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                categories == null
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
                products == null
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Provider.of<ProductDetailsProvider>(context,
                                            listen: false)
                                        .getProductResponse(products[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetails();
                                    }));
                                  },
                                  child: ProductWidget(products[index]));
                            }),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
