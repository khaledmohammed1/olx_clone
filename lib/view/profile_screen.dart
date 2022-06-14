import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/core/view_model/profile_view_model.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (controller) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor,
                        image: DecorationImage(
                            image: controller.usermodel.pic == "default"
                                ? const AssetImage(
                                        "assets/images/facebook logo.jpg")
                                    as ImageProvider
                                : NetworkImage(
                                    controller.usermodel.pic.toString()),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: controller.usermodel.name.toString(),
                          fontSize: 32,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: controller.usermodel.email.toString(),
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ],
                    )

                  ],
                ),
                const SizedBox(height: 100,),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
