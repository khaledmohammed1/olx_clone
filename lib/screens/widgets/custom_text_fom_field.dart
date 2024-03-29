import 'package:flutter/material.dart';
import 'package:shopping_app/constance.dart';

import 'custom_text.dart';
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({Key? key, required this.text, required this.hint, required this.onSave, this.validator,this.keyBoardType =  TextInputType.text,this.enabled = true,this.maxLines = 1}) : super(key: key);
  final String text;
  final String hint;
  final  void Function(String?)? onSave;
  final  String? Function(String?)? validator;
  TextInputType keyBoardType;
  bool enabled;
  int maxLines;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(text: text, fontSize: 14,color: Colors.grey.shade800,),
      TextFormField(
        maxLines: maxLines,
        enabled: enabled,
        keyboardType:keyBoardType,
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
