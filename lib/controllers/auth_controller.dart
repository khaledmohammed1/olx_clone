import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/screens/auth_screens/login_Screen.dart';
import 'package:shopping_app/screens/location_screen/location_screen.dart';
import 'package:shopping_app/services/firestore_user.dart';
import 'package:shopping_app/model/user_model.dart';


class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late String email, password, name, phoneNumber;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
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

    await _firebaseAuth.signInWithCredential(credential).then((user) async {
      await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: user.user!.displayName,
        pic: 'default',
        phoneNumber: '',
      )).then((value) async{
        await Get.offAll(const LocationScreen());
      });
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
           await FireStoreUser().getCurrentUser(value.user!.uid);
           await Get.offAll(const LocationScreen());
      });

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
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        Get.offAll( LoginScreen());
      });
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

}
