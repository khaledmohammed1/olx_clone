import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/location_controller.dart';
import 'package:shopping_app/screens/controll_screen/control_screen.dart';

class LocationScreen extends StatelessWidget {
   LocationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      showBottomScreen(context){
        showModalBottomSheet(
          context:context,
          builder:(context){
            return Column(
              children: [
                AppBar()
              ],
            );
          }
        );
      }

    return GetBuilder<LocationController>(
      init: Get.put(LocationController()),
      builder:(controller)=> Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 20,),
            Image.asset("assets/images/map.png",width: MediaQuery.of(context).size.width*.8,),
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
             Padding(
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

            InkWell(
              onTap: (){
                showBottomScreen(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:const  BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2))
                  ),
                  child: const Text(
                    "Set location manually",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

