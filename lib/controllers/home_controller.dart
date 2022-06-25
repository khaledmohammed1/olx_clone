import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  //
   HomeController() {

   }

}