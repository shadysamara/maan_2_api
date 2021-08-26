import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maan2_api/ui/cart/providers/database_provider.dart';
import 'package:maan2_api/ui/home/models/all_products_response.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  AllProductsResponse product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(child: Text(product.title)),
                    Spacer(),
                    Text(product.price.toString())
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
            child: Container(
          margin: EdgeInsets.all(10),
          child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Provider.of<DatabaseProvider>(context, listen: false)
                      .insertProductInCart(product);
                },
                icon: Icon(
                  Icons.shopping_bag,
                  size: 40,
                ),
              )),
        ))
      ],
    );
  }
}
