import 'package:flutter/material.dart';
import 'package:maan2_api/ui/cart/providers/database_provider.dart';
import 'package:maan2_api/ui/cart/ui/cartWidget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, x) {
          if (provider.cartProdcts == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: provider.cartProdcts.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: CartWidget(provider.cartProdcts[index]),
                  );
                });
          }
        },
      ),
    );
  }
}
