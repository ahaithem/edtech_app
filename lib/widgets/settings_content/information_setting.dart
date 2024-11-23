import 'package:flutter/material.dart';
import '../../constns/color_text_size.dart';

class InformationSetting extends StatefulWidget {
  final String informationType;
  final String informationValue;
  final Icon iconType;

  const InformationSetting(
      {required this.informationType,
      required this.iconType,
      required this.informationValue});

  @override
  State<InformationSetting> createState() => _InformationSettingState();
}

class _InformationSettingState extends State<InformationSetting> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9, // 90% width
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the container
          border: Border.all(
            color: border_color, // Color of the border
            width: 1.0, // Thickness of the border
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the container circular
                color: secondary_color, // Background color of the circle
              ),
              padding: const EdgeInsets.all(
                  8.0), // Padding to make the icon fit nicely inside the circle
              child: Icon(
                widget.iconType.icon,
                color: Colors.white, // Color of the icon
                size: 24.0, // Adjust size if needed
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.informationType,
                  style: TextStyle(
                    color: text_color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.informationValue,
                  style: TextStyle(
                    color: subtitle_color,
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ]),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/next.png',
              height: 50,
              width: 50,
            ),
          ),
        ]),
      ),
    );
  }
}
