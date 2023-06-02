import 'package:path/path.dart';
import 'package:pfa_v2/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper{
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;
  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;
  }
  initDB() async{
    String path =join(await getDatabasesPath(),'card.db');
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version)async{
          await db.execute('''
          CREATE TABLE card $tableCartProduct(
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL
          )
          ''');
    });
  }
  insert(CartProductModel model)async{
    var dbClient = await database;
    await dbClient.insert(tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
}