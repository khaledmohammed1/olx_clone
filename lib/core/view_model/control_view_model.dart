import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/cart_screen.dart';
import '../../view/home_screen.dart';
import '../../view/profile_screen.dart';

class ControlViewModel extends GetxController{
  Widget _currentScreen =  ProfileScreen();
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue){
      case 0 :{
        _currentScreen =  HomeScreen();
        break;
      }case 1 :{
      _currentScreen =  CartScreen();
      break;
    }case 2 :{
      _currentScreen = ProfileScreen();
      break;
    }
    }
    update();
  }
}