import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/model/user_model.dart';



class ProfileController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  UserModel? _usermodel;

  UserModel get usermodel => _usermodel!;

   signOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

}
