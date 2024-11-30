import 'package:edtech_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import '../../constns/color_text_size.dart';
import 'notification_setting.dart';
import 'information_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  // Variables to store user information
  String? userName;
  String? userEmail;
  String?
      userPassword; // Assuming you store a password hint or message, not the actual password

  @override
  @override
  void initState() {
    super.initState();
    getUserData(); // This should be retained to fetch user info on creation
  }

  Future<void> getUserData() async {
    try {
      // Get the current user's UID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Retrieve user data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;

        // Update state with retrieved data
        setState(() {
          userName =
              doc["full_name"]; // Ensure this matches the field in Firestore
          userEmail =
              doc["email"]; // Ensure this matches the field in Firestore
          userPassword =
              "****"; // Store a hint or just show that password is set
        });
      } else {
        // Handle the case where no user data is found
        setState(() {
          userName = 'No name found';
          userEmail = 'No email found';
          userPassword = 'No password found';
        });
      }
    } catch (e) {
      // Handle any errors that occur during the Firestore call
      print("Error fetching user data: $e");
      setState(() {
        userName = 'Error fetching name';
        userEmail = 'Error fetching email';
        userPassword = 'Error fetching password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(title: 'Settings'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/7.png'),
                const SizedBox(height: 20),
                const NotificationSetting(),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9, // 90% width
                  child: Text(
                    'Account information',
                    style: TextStyle(
                      color: text_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: InformationSetting(
                    informationType: 'Name',
                    iconType: const Icon(Icons.person),
                    informationValue: userName ??
                        'Loading...', // Display name or 'Loading...' if null
                  ),
                ),
                const SizedBox(height: 20),
                InformationSetting(
                  informationType: 'Email',
                  iconType: const Icon(Icons.email),
                  informationValue: userEmail ??
                      'Loading...', // Display email or 'Loading...' if null
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'resetpassword');
                  },
                  child: InformationSetting(
                    informationType: 'Password',
                    iconType: const Icon(Icons.password),
                    informationValue: userPassword ??
                        'Loading...', // Display password info or 'Loading...'
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
