import 'package:flutter/material.dart';
import 'package:maan2_api/ui/product_details/providers/product_details_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Consumer<ProductDetailsProvider>(
        builder: (context, provider, x) {
          return provider.product == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      child: Image.network(provider.product.image),
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Text(provider.product.title),
                    Text(provider.product.price.toString()),
                    Text(provider.product.description)
                  ],
                );
        },
      ),
    );
  }
}
