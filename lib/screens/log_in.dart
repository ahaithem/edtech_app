import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';
import '../widgets/text_form_field.dart';
import '../widgets/log_button.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  primary_color), // Set the color of the progress indicator
              // Your CircularProgressIndicator properties here
            ))
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/5.png'),
                      const SizedBox(height: 10),
                      const Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login with social networks',
                        style: TextStyle(color: subtitle_color, fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/fb_icon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/ig_icon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/google_icon.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CostomTextForm(
                        hintText: 'Email',
                        mycontroller: email,
                        validator: (value) {
                          if (value == '') {
                            return 'Cannot be empty';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      CostomTextForm(
                        hintText: 'Password',
                        mycontroller: password,
                        validator: (value) {
                          if (value == '') {
                            return 'Cannot be empty';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          //To verify that the email dosn't empty so we can send email verification
                          if (email.text == '') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'Email Empty',
                              desc: 'Please Enter your email',
                              btnOkOnPress: () {}, // Action for OK button
                            ).show();
                            return;
                          }
                          try {
                            //To send email verification so the user can reset his password
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: email.text);
                            AwesomeDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Check Your Email',
                              desc:
                                  'please check your email and click on the verification link to reset your password',
                              btnOkOnPress: () {}, // Action for OK button
                            ).show();
                          } catch (e) {
                            print(e);
                            AwesomeDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'No existing Email',
                              desc:
                                  'please check the email that you have entred and repeat again',
                              btnOkOnPress: () {}, // Action for OK button
                            ).show();
                          }
                        },
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(color: subtitle_color, fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CostomButtonAuth(
                        title: 'Log in',
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            try {
                              isLoading = true;
                              setState(() {});
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                              isLoading = false;
                              setState(() {});
                              print(
                                  'Login successful: ${credential.user?.email}');
                              //To check if the email that was entered by the user when he sign up is is verified and if not he can't go to the homepage
                              if (credential.user!.emailVerified) {
                                Navigator.of(context).pushNamed('homepage');
                              } else {
                                // Handle other types of errors (e.g., network error)
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Login Failed',
                                  desc:
                                      'please check your email and click on the verification link',
                                  btnOkOnPress: () {}, // Action for OK button
                                ).show();
                              }
                            } on FirebaseAuthException catch (e) {
                              isLoading = true;
                              setState(() {});
                              print('Error code: ${e.code}');

                              // Handle specific errors
                              if (e.code == 'invalid-credential') {
                                // Show a more generic message as this is used for both invalid email and wrong password
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Login Failed',
                                  desc:
                                      'Invalid email or wrong password. Please check your credentials and try again.',
                                  btnOkOnPress: () {}, // Action for OK button
                                ).show();
                                isLoading = false;
                              } else {
                                // Handle other types of errors (e.g., network error)
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Login Failed',
                                  desc:
                                      'An unknown error occurred. Please try again.',
                                  btnOkOnPress: () {}, // Action for OK button
                                ).show();
                                isLoading = false;
                              }
                            } catch (e) {
                              print('Error: $e');
                              print(e);
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('signup');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: subtitle_color, fontSize: 14),
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
