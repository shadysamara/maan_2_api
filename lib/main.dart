import 'package:easy_localization/easy_localization.dart';
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

  await EasyLocalization.ensureInitialized();
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
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: RouteHelper.routeHelper.navKey,
        home: HomePage());
  }
}
