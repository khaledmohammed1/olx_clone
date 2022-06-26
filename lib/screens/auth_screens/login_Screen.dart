
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/controllers/auth_controller.dart';
import 'package:shopping_app/screens/auth_screens/register_Screen.dart';
import 'package:shopping_app/screens/widgets/custom_button_social.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_fom_field.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    const CustomText(
                      text: "Welcome,",
                      fontSize: 30,
                    ),
                    InkWell(
                      onTap: ()=> Get.to(RegisterScreen()),
                      child: const CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const CustomText(
                  text: "sign in to continue",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: "Example@gmail.com",
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value){
                    if(value ==null){
                      print("Error");
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "**************",
                  onSave: (value) {
                    controller.password = value!;
                  },

                  validator: (value){
                    if(value ==null){
                      print("Error");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "Forgot Password",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(text: "Sign In",onPressed: (){
                  _formKey.currentState!.save();
                  if(_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(text: "-OR-", fontSize: 16,alignment: Alignment.center,),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonSocial(text: "Sign In with google",imageName: "assets/images/google logo.png",onPressed: (){
                controller.googleSignInMethod();
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
