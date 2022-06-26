import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/auth_controller.dart';
import '../../constance.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/controll_controller.dart';
import '../auth_screens/login_Screen.dart';



// ignore: must_be_immutable
class ControllScreen extends GetWidget<AuthController> {
   const ControllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      return
        Get.find<AuthController>().user == null?
           LoginScreen():
           GetBuilder<ControllController>(
              init: Get.put(ControllController()),
            builder:(controller)=> Scaffold(
              bottomNavigationBar: _bottomNavigationBar(),
              body: controller.currentScreen,
            ),
          );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControllController>(
      init: Get.put(ControllController()),
      builder: (controller)=>BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 26,
                width: 26,
                child: Image.asset("assets/images/shopping-cart.png")),
            label: "",
            activeIcon: const Padding(
              padding:  EdgeInsets.only(top:12.0),
              child:  Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 26,
                width: 26,
                child: Image.asset("assets/images/bag.png")),
            label: "",
            activeIcon: const Padding(
              padding:  EdgeInsets.only(top:12.0),
              child:  Text(
                "Cart",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/images/pr.png")),
            label: "",

            activeIcon: const Padding(
              padding:  EdgeInsets.only(top:12),
              child:  Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),),
        ],
        onTap: (index) {
          controller.changeSelectedValue(index);
          },
        currentIndex: controller.navigatorValue,
        selectedItemColor: Colors.black,
        backgroundColor: primaryColor.withOpacity(.05),
      ),
    );
  }

}
