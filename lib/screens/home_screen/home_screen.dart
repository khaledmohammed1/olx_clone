import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../controllers/location_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Center(
            child: GetBuilder<LocationController>(
              init: Get.put(LocationController()),
              builder: (locationController) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    locationController.locationData!.longitude.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    locationController.locationData!.latitude.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    locationController.address.toString(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
