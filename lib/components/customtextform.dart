

import 'package:flutter/material.dart';

class CustomTextFormSign extends StatelessWidget {
  String hint;
  TextEditingController controller;
  String? Function(String?) validator;
   CustomTextFormSign({ Key? key, required this.hint, required this.controller, required this.validator }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3)
        ),)
      ),
    );
  }
}