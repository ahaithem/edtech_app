import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget(
      {super.key,
      required this.imageIndex,
      required this.title,
      required this.subTitle});

  final String title;
  final String subTitle;
  final int imageIndex;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fixed image interpolation using proper concatenation
            Image.asset(
              'assets/images/${widget.imageIndex}.png',
              width: 400,
              // height: 300,
            ),
            Text(
              widget.title, // Access widget properties with `widget.<property>`
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              widget
                  .subTitle, // Access widget properties with `widget.<property>`
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

//''
//''
