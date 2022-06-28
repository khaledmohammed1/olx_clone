import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/location_controller.dart';
import 'package:shopping_app/screens/controll_screen/control_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: Get.put(LocationController()),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/map.png",
              width: MediaQuery.of(context).size.width * .8,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "where you want \n buy/sell products",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "to enjoy all that we have to offer you \nwe need to knew where to look for them",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                controller.getLocation().then((value) {
                  if (value != null) {
                    print(controller.locationData!.latitude);
                    print(controller.locationData!.longitude);
                    Get.to(() => const ControllScreen());
                  }
                });
              },
              leading: Icon(
                Icons.my_location,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "Use Current location",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "Enable location",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
