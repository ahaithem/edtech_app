import 'package:flutter/material.dart';
import './profile_content.dart';
import '../constns/color_text_size.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0), // Spacing between containers
            ProfileContent(
              title: 'Your Courses',
              onTap: () {
                // Your onTap logic here
              },
            ),
            const SizedBox(height: 16.0), // Spacing between containers
            ProfileContent(
              title: 'Saved',
              onTap: () {
                // Your onTap logic here
              },
            ),

            const SizedBox(height: 16.0), // Spacing between containers
            ProfileContent(
              title: 'Payment',
              onTap: () {
                // Your onTap logic here
              },
            ),
            const SizedBox(height: 16.0), // Spacing between containers
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: subtitle_color, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
