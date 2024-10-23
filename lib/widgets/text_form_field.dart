import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class CostomTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  CostomTextForm(
      {super.key,
      required this.hintText,
      required this.mycontroller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: subtitle_color),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          filled: true,
          //fillColor: Colors.grey[400],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFFBEBAB3) /*Colors.grey*/)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}
