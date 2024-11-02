import 'package:flutter/material.dart';
import '../../constns/color_text_size.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool light = true;
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
              child: const Icon(
                Icons.notifications,
                color: Colors.white, // Color of the icon
                size: 24.0, // Adjust size if needed
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Notification',
              style: TextStyle(
                color: text_color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          Transform.scale(
            scale: 0.6, // Adjust the scale factor to make the switch smaller
            child: Switch(
              value: light,
              activeColor: success_color,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          )
        ]),
      ),
    );
  }
}
