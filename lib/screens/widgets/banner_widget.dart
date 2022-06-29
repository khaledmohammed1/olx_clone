import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .27,
        color: Theme.of(context).primaryColor.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "Cars",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                FadeAnimatedText(
                                  "Reach 10k\nInterested Buyers",
                                  duration: const Duration(seconds: 4),
                                ),
                                FadeAnimatedText(
                                  'New Way to\nBuy or Sell Cars',
                                  duration: const Duration(seconds: 4),
                                ),
                                FadeAnimatedText(
                                  'Over 1k\nCars to buy',
                                  duration: const Duration(seconds: 4),
                                ),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Neumorphic(

                      style: const NeumorphicStyle(color: Colors.white,oppositeShadowLightSource: true),
                      child: Image.network(
                        "https://res.cloudinary.com/kha10led/image/upload/v1656469756/ecommerce/icons8-car-100_qzri0l.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: NeumorphicButton(
                      onPressed: () {},
                      style: const NeumorphicStyle(color: Colors.white),
                      child: const Text(
                        "Buy Car",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: NeumorphicButton(
                      onPressed: () {},
                      style: const NeumorphicStyle(color: Colors.white),
                      child:
                          const Text("Sell Car", textAlign: TextAlign.center),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
