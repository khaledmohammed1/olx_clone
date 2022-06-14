import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/core/controllers/home_controller.dart';
import 'package:shopping_app/view/products_details_screen.dart';

import '../core/controllers/cart_controller.dart';


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  CartController cartViewModel = Get.put(CartController());
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchTextFormField(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        " Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Products",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewProducts(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primaryColor.withOpacity(.1),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeController>(
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : SizedBox(
              height: 100,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.categoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(.05),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: 70,
                          height: 70,
                          child: Image(
                            image: NetworkImage(
                                controller.categoryModel[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          controller.categoryModel[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      )),
            ),
    );
  }

  Widget _listViewProducts() {
    return SizedBox(
      height: 240,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
              child: Container(
                width: 170,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.05),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProductDetail(
                            model: controller.productModel[index]));
                      },
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.productModel[index].image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      controller.productModel[index].name,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.productModel[index].price,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          "EGP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1.5),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 6, top: 2, left: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            " Add to cart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: (){
                              // cartViewModel.addToCart(
                              //     controller.productModel[index]);
                            },
                            child: Container(
                              width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Theme.of(context).primaryColor),

                                  child: const  Icon(Icons.add,color: Colors.white,size: 26,
                            ),



                                ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 12,
          ),
        ),
      ),
    );
  }
}
