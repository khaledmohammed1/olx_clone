import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../services/home_services.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];
  //
   HomeController() {
     getCategory();
    getProducts();
   }

  getCategory() {
    _loading.value = true;
     HomeService().getCategory().then((value) {
      for(int i=0 ;i<value.docs.length;i++){
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getProducts() {
    _loading.value = true;
    HomeService().getProducts().then((value) {
      for(int i=0 ;i<value.docs.length;i++){
        _productModel.add(ProductModel.fromJson(value.docs[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}