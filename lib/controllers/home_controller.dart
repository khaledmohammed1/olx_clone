import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/location_controller.dart';


class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

   HomeController() {
    LocationController();
   }

}