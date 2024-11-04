import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';
import '../widgets/text_form_field.dart';
import '../widgets/log_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
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
                Image.asset('assets/images/6.png'),
                const SizedBox(height: 10),
                const Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Create your account',
                  style: TextStyle(color: subtitle_color, fontSize: 14),
                ),
                const SizedBox(height: 10),
                CostomTextForm(
                  hintText: 'Name',
                  mycontroller: name,
                  //To ensure that the name field is not empty
                  validator: (value) {
                    if (value == '') {
                      return 'Cannot be empty';
                    }
                  },
                ),
                const SizedBox(height: 10),
                CostomTextForm(
                  hintText: 'Email',
                  mycontroller: email,
                  //To ensure that the email field is not empty
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
                    //To ensure that the password field is not empty
                    if (value == '') {
                      return 'Cannot be empty';
                    }
                  },
                ),
                const SizedBox(height: 10),
                CostomButtonAuth(
                    title: 'Sign up',
                    //To ensure that the form is not empty and valid
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );

                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();

                          // Immediately add user to Firestore after creation
                          await users.add({
                            'id': FirebaseAuth.instance.currentUser!.uid,
                            'full_name': name.text,
                            'email': email.text,
                            'password': password.text,
                          });
                          print("User Added");

                          Navigator.of(context).pop(); // Go back to login page
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Weak Password',
                              desc: 'The password provided is too weak.',
                            )..show();
                          } else if (e.code == 'email-already-in-use') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Email In Use',
                              desc:
                                  'The account already exists for that email.',
                            )..show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    }),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text(
                    'Log in',
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
