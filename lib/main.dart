import 'package:flutter/material.dart';
import 'package:maan2_api/helpers/route_helper.dart';
import 'package:maan2_api/ui/cart/data/sqflite_helper.dart';
import 'package:maan2_api/ui/cart/providers/database_provider.dart';
import 'package:maan2_api/ui/home/providers/home_provider.dart';
import 'package:maan2_api/ui/home/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'ui/product_details/providers/product_details_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.cartDbHelper.initDatabase();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<ProductDetailsProvider>(
          create: (context) => ProductDetailsProvider(),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
      ],
      child: MaterialApp(
          navigatorKey: RouteHelper.routeHelper.navKey, home: HomePage())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
