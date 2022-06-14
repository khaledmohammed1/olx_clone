// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/view/widgets/custom_button.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

import '../core/controllers/cart_controller.dart';
import '../model/product_model.dart';

class CartScreen extends StatelessWidget {
  ProductModel? model;

  CartScreen({
    Key? key,
    this.model,
  }) : super(key: key) {
    CartController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: Get.put(CartController()),
      builder: (controller) => SafeArea(
        child: controller.cartProductModel.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    height: MediaQuery.of(context).size.height * .30,
                    child: Image.asset("assets/images/empty-cart.png"),
                  ),
                  const CustomText(
                    text: "Cart Is Empty",
                    fontSize: 40,
                    alignment: Alignment.center,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GetBuilder<CartController>(
                        builder: (controller) => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * .2,
                              child: Row(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .14,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Image.network(
                                        controller.cartProductModel[index].image
                                            .toString(),
                                        fit: BoxFit.fill,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        Text(
                                          controller
                                              .cartProductModel[index].name,
                                          // controller.cartItems[index].name.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller
                                                  .cartProductModel[index].price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(width: 3),
                                            const Text(
                                              "EGP",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                width: 30,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 30,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomText(
                                                alignment: Alignment.center,
                                                text: controller
                                                    .cartProductModel[index]
                                                    .quantity
                                                    .toString(),
                                                fontSize: 20),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                width: 30,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: SizedBox(
                                                  height: 5,
                                                  width: 5,
                                                  child: Image.asset(
                                                    "assets/images/minus.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.deleteProduct(
                                          controller.cartProductModel[index]);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 100),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.cartProductModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10.0, left: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            const Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GetBuilder<CartController>(
                                  init: CartController(),
                                  builder: (controller) => Text(
                                    controller.totalPrice.toString(),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                const Text(
                                  "EGP",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, bottom: 2),
                          width: MediaQuery.of(context).size.width * .6,
                          child:
                              CustomButton(text: "CheckOut", onPressed: () {
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
