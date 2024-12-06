import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class CostomTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  final TextInputType keyboardType;
  // The type of keyboard to use for editing the text.

  final List<String>
      autofillHints; // The list of autofill hints to be used for autofill suggestions.
  final bool obscureText;
  // Whether the text field should obscure the text being edited (e.g., for passwords).

  CostomTextForm(
      {super.key,
      required this.hintText,
      required this.mycontroller,
      required this.validator,
      this.autofillHints = const [],
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: mycontroller,
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      obscureText: obscureText,
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
