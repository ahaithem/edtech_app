import 'package:edtech_app/screens/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Scaffold(
        // appBar: const PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: AppBarWidget(title: 'Profile'),
        // ),
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
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LogIn()));
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
      ),
    );
  }
}
