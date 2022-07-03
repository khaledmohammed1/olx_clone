import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellCarFormController extends GetxController{


  final formKey = GlobalKey<FormState>();
  validate() {
    if (formKey.currentState!.validate()) {
      print("validate");
    }

  }

  List models= [];
  List<String> fuelList =["Diesel","Petrol","Electric","LPG"];
  List<String> transmissionList =["Manual","Automatic"];
  List<String> noOfOwnerList =["1","2","3","4","4+"];
 TextEditingController modelTextEditingController = TextEditingController();
 TextEditingController yearTextEditingController = TextEditingController();
 TextEditingController priceTextEditingController = TextEditingController();
 TextEditingController fuelTextEditingController = TextEditingController();
 TextEditingController transmissionTextEditingController = TextEditingController();
 TextEditingController kmTextEditingController = TextEditingController();
 TextEditingController ownerTextEditingController = TextEditingController();
 TextEditingController titleTextEditingController = TextEditingController();
 TextEditingController descriptionTextEditingController = TextEditingController();
 TextEditingController addressTextEditingController = TextEditingController();
  chooseModel(index){
    modelTextEditingController.text = models[index];
    update();
    print(modelTextEditingController.text);
    Get.back();
  }
  chooseFuel(index){
    fuelTextEditingController.text = fuelList[index];
    update();
    print(fuelTextEditingController.text);
    Get.back();
  }
  chooseTransmission(index){
    transmissionTextEditingController.text = transmissionList[index];
    update();
    print(transmissionTextEditingController.text);
    Get.back();
  }
  chooseOwner(index){
    ownerTextEditingController.text = noOfOwnerList[index];
    update();
    print(ownerTextEditingController.text);
    Get.back();
  }
}