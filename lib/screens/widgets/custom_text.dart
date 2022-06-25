import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
     this.color = Colors.black,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: color),
      ),
    );
  }
}
