// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/profile_controller.dart';
import 'package:shopping_app/screens/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 150,
              height: 60,
              child: CustomButton(
                text: 'Sign out',
                onPressed: () {
                  controller.signOut();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
