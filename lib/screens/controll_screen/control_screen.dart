import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/location_screen/location_screen.dart';
import 'package:shopping_app/screens/sell_screen/sell_screen.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/controll_controller.dart';
import '../../controllers/location_controller.dart';
import '../auth_screens/login_Screen.dart';

// ignore: must_be_immutable
class ControllScreen extends GetWidget<AuthController> {
  const ControllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Get.put(AuthController());
      Get.put(LocationController());
      if (Get.find<AuthController>().user == null) {
        return LoginScreen();
      } else {
        return GetBuilder<ControllController>(
          init: Get.put(ControllController()),
          builder: (controller) => GetBuilder<LocationController>(
            init: Get.put(LocationController()),
            builder: (locationController) => locationController.address == null
                ? const LocationScreen()
                : Scaffold(
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Get.to(const SellScreen());
                      },
                      child:  CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.miniCenterDocked,
                    bottomNavigationBar: BottomAppBar(
                      shape: const CircularNotchedRectangle(),
                      notchMargin: 0,
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(
                                  minWidth: 40,
                                  onPressed: () {
                                    controller.changeSelectedValue(0);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/shopping-cart.png',
                                        width: 30,
                                      ),
                                      controller.navigatorValue == 0
                                          ? const Text(
                                        "Home",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )
                                          : const Text("Home")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(
                                  minWidth: 40,
                                  onPressed: () {
                                    controller.changeSelectedValue(1);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/message.png',
                                        width: 30,
                                      ),
                                      controller.navigatorValue == 1
                                          ? const Text(
                                        "Chat",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )
                                          : const Text("Chat")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(
                                  minWidth: 40,
                                  onPressed: () {
                                    controller.changeSelectedValue(2);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/bag.png',
                                        width: 30,
                                      ),
                                      controller.navigatorValue == 2
                                          ? const Text(
                                        "Cart",
                                        style:  TextStyle(
                                            color: Colors.white),
                                      )
                                          : const Text("Cart")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MaterialButton(
                                  minWidth: 40,
                                  onPressed: () {
                                    controller.changeSelectedValue(3);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/pr.png',
                                        width: 30,
                                      ),
                                      controller.navigatorValue == 3
                                          ? const Text(
                                              "Profile",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          : const Text("Profile")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: controller.currentScreen,
                  ),
          ),
        );
      }
    });
  }
}
