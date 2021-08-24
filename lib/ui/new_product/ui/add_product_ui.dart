import 'package:flutter/material.dart';
import 'package:maan2_api/ui/new_product/data/api_helper.dart';
import 'package:maan2_api/ui/new_product/models/add_product_model.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('test new product'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Test Add Product'),
          onPressed: () {
            AddNewProductRequest request = AddNewProductRequest(
                category: 'category',
                description: 'description',
                image: 'image',
                price: 123,
                title: 'title');
            NewProductApiHelper.apiHelper.addNewProduct(request);
          },
        ),
      ),
    );
  }
}
