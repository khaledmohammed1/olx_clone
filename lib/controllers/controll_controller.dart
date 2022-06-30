import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/chat_screen/chat_screen.dart';

import '../screens/cart_screen/cart_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class ControllController extends GetxController{
  Widget _currentScreen = const  HomeScreen();
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue){
      case 0 :{
        _currentScreen =  const HomeScreen();
        break;
      }case 1 :{
      _currentScreen =  const ChatScreen();
      break;
    }case 2 :{
      _currentScreen = const CartScreen();
      break;
    }case 3 :{
      _currentScreen = const ProfileScreen();
      break;
    }
    }
    update();
  }
}