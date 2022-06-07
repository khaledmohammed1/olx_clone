import 'package:path/path.dart';
import 'package:shopping_app/model/cart_porduct_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
      CREATE DATABASE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      )
    
    ''');
    });
  }

  insert(CartProductModel model) async{
    var dbClient = await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty ?
        maps.map((product) => CartProductModel.fromJson(product as Map<String,dynamic>)).toList():[];

    return list;
  }
}
