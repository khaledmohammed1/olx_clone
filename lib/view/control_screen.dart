import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/view_model/auth_view_model.dart';
import '../constance.dart';
import '../core/view_model/control_view_model.dart';
import 'auth/login_Screen.dart';


// ignore: must_be_immutable
class ControllScreen extends GetWidget<AuthViewModel> {
   const ControllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      return
        Get.find<AuthViewModel>().user == null?
           LoginScreen():
           GetBuilder<ControlViewModel>(
              init: Get.put(ControlViewModel()),
            builder:(controller)=> Scaffold(
              bottomNavigationBar: _bottomNavigationBar(),
              body: controller.currentScreen,
            ),
          );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.put(ControlViewModel()),
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
                height: 26,
                width: 26,
                child: Image.asset("assets/images/profile.png")),
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
