import 'package:flutter/material.dart';
import 'package:shopping_app/constance.dart';

import 'custom_text.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.text, required this.hint, required this.onSave, this.validator,}) : super(key: key);
  final String text;
  final String hint;
  final  void Function(String?)? onSave;
  final  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(text: text, fontSize: 14,color: Colors.grey.shade800,),
      TextFormField(
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor)
          ),
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.grey
          ),
          fillColor: Colors.white,
        ),
      ),
    ],
    );
  }
}
