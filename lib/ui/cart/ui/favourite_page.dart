import 'package:flutter/material.dart';
import 'package:maan2_api/ui/cart/providers/database_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Favourite Page'),
        ),
        body: Consumer<DatabaseProvider>(
          builder: (context, provider, x) {
            if (provider.favouriteProdcts == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: provider.favouriteProdcts.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(provider
                                          .favouriteProdcts[index].image)))),
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: IconButton(
                                  onPressed: () {
                                    provider.deleteProductInFavourite(
                                        provider.favouriteProdcts[index].id);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 30,
                                  )),
                            ),
                          ))
                        ],
                      );
                    }),
              );
            }
          },
        ));
  }
}
