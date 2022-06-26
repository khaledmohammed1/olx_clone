import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/controll_controller.dart';
import 'package:shopping_app/controllers/location_controller.dart';
import 'package:shopping_app/controllers/profile_controller.dart';
import 'package:shopping_app/helper/local_storage_data.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';


class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ControllController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => LocationController());

  }

}