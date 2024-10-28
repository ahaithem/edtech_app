import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';
import '../widgets/text_form_field.dart';
import '../widgets/log_button.dart';

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
                CostomButtonAuth(
                  title: 'Sign up',
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        Navigator.of(context).pushReplacementNamed('login');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
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
