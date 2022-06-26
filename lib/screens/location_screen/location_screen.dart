import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/location_controller.dart';
import 'package:shopping_app/screens/controll_screen/control_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("assets/images/location.jpg"),
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
          GetBuilder<LocationController>(
            init: LocationController(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: controller.loading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton.icon(
                            onPressed: () {
                              controller.getLocation().then((value) {
                                if (value != null) {
                                  print(controller.locationData!.latitude);
                                  print(controller.locationData!.longitude);
                                  Get.to(()=>const ControllScreen());
                                }
                              });
                            },
                            icon: const Icon(CupertinoIcons.location_fill),
                            label: const Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text("Around Me"),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Set location manually",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
