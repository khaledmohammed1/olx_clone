// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/profile_controller.dart';
import 'package:shopping_app/screens/widgets/custom_button.dart';

import 'location_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 60,
                  child: CustomButton(
                    text: 'Sign out',
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 150,
                  height: 60,
                  child: CustomButton(
                    text: 'Get Location',
                    onPressed: () {
                      Get.to(const LocationScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
