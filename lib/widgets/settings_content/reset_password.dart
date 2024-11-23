import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:edtech_app/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(title: 'Settings'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              try {
                // Retrieve the current user's email
                final user = FirebaseAuth.instance.currentUser;

                if (user != null && user.email != null) {
                  final email = user.email!;

                  // Send a password reset email
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email);

                  // Show success dialog
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    title: 'Check Your Email',
                    desc:
                        'Please check your email and click on the link to reset your password.',
                    btnOkOnPress: () {}, // Action for OK button
                  ).show();
                } else {
                  // Show error dialog if no user is logged in
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'No User Found',
                    desc:
                        'No logged-in user found. Please log in and try again.',
                    btnOkOnPress: () {},
                  ).show();
                }
              } catch (e) {
                print(e);
                // Show error dialog
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.rightSlide,
                  title: 'Error',
                  desc: 'Something went wrong. Please try again later.',
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: const Text('Do you want to change your password?'),
          ),
        ),
      ),
    );
  }
}
