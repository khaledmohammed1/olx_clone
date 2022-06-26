import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/services/firestore_user.dart';
import 'package:shopping_app/model/user_model.dart';
import 'package:shopping_app/screens/auth_screens/login_Screen.dart';
import 'package:shopping_app/screens/controll_screen/control_screen.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name, phoneNumber;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

 // final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: user.user!.displayName,
        pic: 'default',
        phoneNumber: '',
      ));
      Get.offAll(const ControllScreen());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
           await FireStoreUser().getCurrentUser(value.user!.uid);
      });
      Get.offAll(const ControllScreen());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(LoginScreen());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name,
      pic: 'default',
      phoneNumber:phoneNumber,
    );
    await FireStoreUser().addUserToFireStore(userModel);
  }

  // void setUser(UserModel userModel) async {
  //  await localStorageData.setUser(userModel);
  //}
}
