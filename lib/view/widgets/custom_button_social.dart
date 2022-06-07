import 'package:flutter/material.dart';

import 'custom_text.dart';
class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({Key? key, required this.text, required this.imageName, this.onPressed}) : super(key: key);
  final String text;
  final String imageName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100
      ),
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(imageName,height: 25,width: 25,),
              const SizedBox(width: 40,),
               CustomText(text: text, fontSize: 16),
            ],
          )
      ),
    );
  }
}
