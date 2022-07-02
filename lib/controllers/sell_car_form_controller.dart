import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellCarFormController extends GetxController{
  List models= [];
 TextEditingController modelTextEditingController = TextEditingController();
 TextEditingController yearTextEditingController = TextEditingController();
 TextEditingController priceTextEditingController = TextEditingController();
 TextEditingController fuelTextEditingController = TextEditingController();
  chooseModel(index){
    modelTextEditingController.text = models[index];
    update();
    print(modelTextEditingController.text);
    Get.back();
  }
}