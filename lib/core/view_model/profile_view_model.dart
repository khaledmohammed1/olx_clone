import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/model/user_model.dart';
import 'package:shopping_app/view/auth/login_Screen.dart';

import '../../helper/local_storage_data.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel? _usermodel;

  UserModel get usermodel => _usermodel!;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserData();
  }

  Future getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) async {
      _usermodel = value!;
    });
    _loading.value = false;
    update();
  }
}
