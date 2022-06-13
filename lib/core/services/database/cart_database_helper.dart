import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();

  static final CartDataBaseHelper db = CartDataBaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }
}

_initDb() async {
  String path = join(await getDatabasesPath(), "CartProduct.db");
  return await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
       await db.execute(''' 
       CREATE TABLE $tableCartProduct(
       $columnName 
       )
       ''');
    },
  );
}
