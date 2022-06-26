import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shopping_app/screens/controll_screen/control_screen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: EasySplashScreen(
        logo: Image.asset(
            'assets/images/shopping-cart.png',width: MediaQuery.of(context).size.width*.8,),
        title: const Text(
          "  Buy And Sell",textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        showLoader: false,
        navigator: const ControllScreen(),
        durationInSeconds: 2,
      ),
    );
  }
}