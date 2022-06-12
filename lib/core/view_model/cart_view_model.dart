import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_porduct_model.dart';
import '../services/database/cart_database_helper.dart';

class CartViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel(){
    //getAllProduct();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
  //
  // getAllProduct() async {
  //   _loading.value = true;
  //
  //   var dbHelper = CartDataBaseHelper.db;
  //   _cartProductModel = await dbHelper.getAllProduct();
  //   print(cartProductModel.length);
  //
  //   _loading.value = false;
  //   update();
  // }
}
