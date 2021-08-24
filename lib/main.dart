import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/providers/home_provider.dart';
import 'package:maan2_api/ui/home/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'ui/product_details/providers/product_details_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider<ProductDetailsProvider>(
      create: (context) => ProductDetailsProvider(),
    ),
  ], child: MaterialApp(home: HomePage())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
