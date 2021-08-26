import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();
  static DbHelper cartDbHelper = DbHelper._();
  static final String cartTableName = 'cart';
  static final String productDetailsColumn = 'productDetails';
  static final String id = 'id';
  static final String favouriteTableName = 'favourites';

  Database database;
  initDatabase() async {
    database = await createDatabase();
  }

  Future<Database> createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String directoryPath = directory.path;
    String databasePath = join(directoryPath, 'EcommerceApp.db');
    Database database =
        await openDatabase(databasePath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $cartTableName ($id INTEGER PRIMARY KEY, $productDetailsColumn TEXT)');

      db.execute(
          'CREATE TABLE $favouriteTableName ($id INTEGER PRIMARY KEY, $productDetailsColumn TEXT)');
    });
    return database;
  }

  addToCart(String productDetails, int productId) async {
    int x = await database.insert(
        cartTableName, {'id': productId, productDetailsColumn: productDetails});
    print(x);
  }

  addToFavourite(String productDetails, int productId) async {
    int x = await database.insert(favouriteTableName,
        {'id': productId, productDetailsColumn: productDetails});
    print(x);
  }

  Future<List<Map<String, Object>>> getCart() async {
    List<Map<String, Object>> maps = await database.query(cartTableName);
    return maps;
  }

  Future<List<Map<String, Object>>> getFavourite() async {
    List<Map<String, Object>> maps = await database.query(favouriteTableName);
    return maps;
  }

  removeFromCart(int id) async {
    int x =
        await database.delete(cartTableName, where: 'id=?', whereArgs: [id]);
    print(x);
  }

  removeFromFavourite(int id) async {
    int x = await database
        .delete(favouriteTableName, where: 'id=?', whereArgs: [id]);
    print(x);
  }
}
