import 'package:edtech_app/constns/color_text_size.dart';
import 'package:flutter/material.dart';

class CostomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CostomButtonAuth(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 56,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: primary_color,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
