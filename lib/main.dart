import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/screens/splash_screen/splash_screen.dart';
import 'helper/binding.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  await GetStorage.init();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:const Color.fromRGBO(51, 153, 255, .1),
      100:const Color.fromRGBO(51, 153, 255, .2),
      200:const Color.fromRGBO(51, 153, 255, .3),
      300:const Color.fromRGBO(51, 153, 255, .4),
      400:const Color.fromRGBO(51, 153, 255, .5),
      500:const Color.fromRGBO(51, 153, 255, .6),
      600:const Color.fromRGBO(51, 153, 255, .7),
      700:const Color.fromRGBO(51, 153, 255, .8),
      800:const Color.fromRGBO(51, 153, 255, .9),
      900:const Color.fromRGBO(51, 153, 255, 1),
    };
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: MaterialColor(0xff075087,color),
      ),
      home: SplashScreen()
    );
  }
}

