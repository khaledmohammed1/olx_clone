import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
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
          TextButton(
              onPressed: () {},
              child: const Text(
                "Set location manually",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )),
        ],
      ),
    );
  }
}
