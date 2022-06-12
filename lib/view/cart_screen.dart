// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  List<String> names = [
    "product name",
    "product name",
    "product name",
    "product name",
    "product name",
  ];
  List<int> prices = [
    100,
    300,
    400,
    120,
    160,
  ];
  List<String> images = <String>[
    "assets/images/fruits.png",
    "assets/images/fruits.png",
    "assets/images/fruits.png",
    "assets/images/shopping-cart.png",
    "assets/images/fruits.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Row(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .14,
                      width: MediaQuery.of(context).size.width * .3,
                      child: Image.asset(
                        images[index].toString(),
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        Text(
                          names[index].toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prices[index].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              "EGP",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 30,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size :30,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const CustomText(
                                alignment: Alignment.center,
                                text: "1",
                                fontSize: 20),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 30,
                              height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(.2),
                                borderRadius: BorderRadius.circular(8),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: names.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
