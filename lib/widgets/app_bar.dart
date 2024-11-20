import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  const AppBarWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
      child: AppBar(
        automaticallyImplyLeading: false, // To remove the default back button
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: border_color),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/back.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            if (title != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                      color: text_color,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
