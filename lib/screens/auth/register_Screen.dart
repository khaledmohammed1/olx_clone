import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/auth/login_Screen.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_fom_field.dart';

class RegisterScreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.offAll(LoginScreen());
            },
            child: const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 26,
              ),
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'name',
                  onSave: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),CustomTextFormField(
                  keyBoardType: TextInputType.phone,
                  text: 'Phone Number',
                  hint: 'Enter valid phone number',
                  onSave: (value) {
                    controller.phoneNumber = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'example@gmail.com',
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN Up',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}