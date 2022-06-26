import 'package:flutter/material.dart';
class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Image.asset("assets/images/location.jpg"),
      ],),
    );
  }
}
