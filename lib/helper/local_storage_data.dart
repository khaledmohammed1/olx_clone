import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/model/user_model.dart';

import '../constance.dart';


class LocalStorageData extends GetxController{



  Future<UserModel?> get getUser async {
      try{
        UserModel userModel = await  _getUserData();
        if(userModel == null){
          return null;
        }
        return userModel;
      }catch(err){
        print(err);
        return null;
      }
  }

  _getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var value = prefs.getString(cashedUserData);
     return UserModel.fromJson(json.decode(value!));
  }
  setUser(UserModel userModel)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cashedUserData, json.encode(userModel.toJson()));
  }

  deleteUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

  }


}