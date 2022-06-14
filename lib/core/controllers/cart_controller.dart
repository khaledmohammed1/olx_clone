import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/services/database/cart_database_helper.dart';
import 'package:shopping_app/model/cart_product_model.dart';

import '../../constance.dart';

class CartController extends GetxController {
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

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDataBaseHelper.db;

  CartController() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        Get.snackbar("Product Already at Cart",
            "${cartProductModel.name} Already at Cart",
            backgroundColor: Colors.black.withOpacity(.7),
            colorText: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd);
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        double.parse(cartProductModel.price) * cartProductModel.quantity;
    Get.snackbar("Product Added to Cart",
        "${cartProductModel.name} Have been Added to the cart",
        backgroundColor: Colors.black.withOpacity(.7),
        colorText: primaryColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.startToEnd);
    update();
  }

  deleteProduct(CartProductModel cartProductModel) async {
    await dbHelper.deleteProduct(cartProductModel);
    _cartProductModel.remove(cartProductModel);
     _totalPrice = 0.0;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity;
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += double.parse(_cartProductModel[index].price);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProductModel[index].quantity > 1) {
      _cartProductModel[index].quantity--;
      _totalPrice -= double.parse(_cartProductModel[index].price);
      await dbHelper.updateProduct(_cartProductModel[index]);
      update();
    } else {
      return;
    }
  }
}
