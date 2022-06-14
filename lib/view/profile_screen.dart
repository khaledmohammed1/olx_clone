// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/core/view_model/profile_view_model.dart';
import 'package:shopping_app/view/auth/login_Screen.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Scaffold(
              body: Container(
                padding: const EdgeInsets.only(top: 80),
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
                                              "assets/images/pr.png",)
                                          as ImageProvider
                                      : NetworkImage(
                                          controller.usermodel.pic.toString()),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(
                        height: 100,
                      ),
                      ProfileListTile(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        title: "Edit Profile",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ProfileListTile(
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                        title: "Shipping Address",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ProfileListTile(
                        icon: const Icon(
                          Icons.history,
                          color: Colors.black,
                        ),
                        title: "Order History",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ProfileListTile(
                        icon: const Icon(
                          Icons.credit_card_sharp,
                          color: Colors.black,
                        ),
                        title: "Cards",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ProfileListTile(
                        icon: const Icon(
                          Icons.notification_important_outlined,
                          color: Colors.black,
                        ),
                        title: "Notification",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.signOut();
                        },
                        child: ProfileListTile(
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.black,
                          ),
                          title: "LogOut",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  ProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  Icon icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: ListTile(
        title: CustomText(
          fontSize: 16,
          text: title,
        ),
        leading: icon,
        trailing: const Icon(
          Icons.navigate_next_rounded,
          size: 34,
          color: Colors.black,
        ),
      ),
    );
  }
}
