import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class ProfileContent extends StatelessWidget {
  final String? title;
  final void Function()? onTap; // Make this field final

  const ProfileContent({
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // 90% width
        child: Container(
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: border_color,
              width: 2.0,
            ),
          ),
          child: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: text_color,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
