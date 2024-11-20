import 'package:flutter/material.dart';
import './profile_content.dart';
import '../constns/color_text_size.dart';
import 'app_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(kToolbarHeight),
      //   child: Container(
      //     alignment: Alignment.center,
      //     child: ConstrainedBox(
      //       constraints:
      //           BoxConstraints(maxWidth: 400), // Adjust the width as needed
      //       child: AppBarWidget(title: 'Profile'),
      //     ),
      //   ),
      // ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'Profile'),
      ),
      body: Center(
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
                  Navigator.pushNamed(context, 'checkout');
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
      ),
    );
  }
}
