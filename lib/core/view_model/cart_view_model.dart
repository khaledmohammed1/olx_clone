import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';

import '../../constance.dart';

class CartViewModel extends GetxController {
  var cartItems = <ProductModel>[].obs;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + int.parse(item.price));

  addToCart(ProductModel productModel) {
    cartItems.add(productModel);
    Get.snackbar(
      "Product Added to Cart",
      "${productModel.name} Have been Added to the cart",
      backgroundColor: Colors.transparent,
      colorText: primaryColor,
      snackPosition: SnackPosition.BOTTOM
    );
  }
}
