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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  onTap: () {},
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
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                        print('Login successful: ${credential.user?.email}');
                        Navigator.of(context).pushNamed('homepage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        } else if (e.code == 'invalid-email') {
                          print('The email address is not valid.');
                        } else if (e.code == 'user-disabled') {
                          print('The user account has been disabled.');
                        } else if (e.code == 'too-many-requests') {
                          print('Too many requests. Try again later.');
                        } else {
                          print('Error: ${e.message}');
                        }
                      } catch (e) {
                        print('Error: $e');
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