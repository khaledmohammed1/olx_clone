import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/services/database/cart_database_helper.dart';
import 'package:shopping_app/model/cart_product_model.dart';

import '../../constance.dart';

class CartViewModel extends GetxController {
  // var cartItems = <ProductModel>[].obs;
  //
  // double get totalPrice =>
  //     cartItems.fold(0, (sum, item) => sum + int.parse(item.price));
  //
  // addToCart(ProductModel productModel) {
  //   cartItems.add(productModel);
  //   Get.snackbar(
  //     "Product Added to Cart",
  //     "${productModel.name} Have been Added to the cart",
  //     backgroundColor: Colors.transparent,
  //     colorText: primaryColor,
  //     snackPosition: SnackPosition.BOTTOM
  //   );
  // }
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDataBaseHelper.db;
   _cartProductModel =  await dbHelper.getAllProduct();
   print(_cartProductModel.length);
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    Get.snackbar(
        "Product Added to Cart",
        "${cartProductModel.name} Have been Added to the cart",
        backgroundColor: Colors.black.withOpacity(.7),
        colorText: primaryColor,
        snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd
    );
    update();
  }
}
