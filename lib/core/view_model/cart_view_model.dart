import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';
import '../service/database/cart_database_helper.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  addProduct(
    CartProductModel cartProductModel,
  ) async {
    var dbHelper=CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
}
