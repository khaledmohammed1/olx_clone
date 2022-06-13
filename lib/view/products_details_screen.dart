import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/cart_product_model.dart';
import 'package:shopping_app/view/widgets/custom_button.dart';

import '../core/view_model/cart_view_model.dart';
import '../model/product_model.dart';

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
  final cartController = Get.put(CartViewModel());
  ProductModel model;

  ProductDetail({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 25.0),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(model.image), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white.withOpacity(.5),
                  ),
                  width: 30,
                  height: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              model.name,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: const [
              // isFavorite
              //     ? Icon(Icons.favorite,
              //         size: 36, color: Theme.of(context).primaryColor)
              //     : Icon(Icons.favorite_border,
              //         size: 36, color: Theme.of(context).primaryColor)
            ]),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Center(
                  child: Text(model.description,
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.black.withOpacity(.5))),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          model.price,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "EGP",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => SizedBox(
                  width: MediaQuery.of(context).size.width * .55,
                  child: CustomButton(
                    text: 'add to cart',
                    onPressed: () {
                      controller.addProduct(
                        CartProductModel(
                            image: model.image,
                            name: model.name,
                            price: model.price,
                            quantity: 1),
                      );
                      // cartController.addToCart(model);
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
