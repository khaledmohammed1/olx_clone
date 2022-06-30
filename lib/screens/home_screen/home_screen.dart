import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/widgets/banner_widget.dart';
import 'package:shopping_app/screens/widgets/category_widget.dart';

import '../../controllers/home_controller.dart';
import '../../controllers/location_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => SafeArea(
        child: GetBuilder<LocationController>(
          init: Get.put(LocationController()),
          builder: (locationController) => Scaffold(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.01),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  const Icon(Icons.location_on_outlined,color: Colors.black,),
                  const SizedBox(width: 20,),
                  Text(locationController.address!.toString(),style: const TextStyle(color: Colors.black,fontSize: 18),),
                ],
              ),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,0,12,8),
                    child: Row(
                      children:  [
                        Expanded(
                          child:  SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Find Cars,Mobiles and many more",
                                  labelStyle: const TextStyle(fontSize: 12),
                                  contentPadding: const EdgeInsets.only(left: 10,right: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  prefixIcon: const Icon(Icons.search,)
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(Icons.notifications_none),
                        const SizedBox(width: 10,),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12,0,12,8),
                  child: Column(
                    children: const [
                       BannerWidget(),
                      CategoryWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
