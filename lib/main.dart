import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/first_screen.dart';
import './screens/learn_any_time.dart';
import './screens/log_in.dart';
import './screens/sign_up.dart';
import 'home_page.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=============================User is currently signed out!');
      } else {
        print('=============================User is signed in!');
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
      routes: {
        'learnanytime': (context) => LearnAnyTime(),
        'login': (context) => LogIn(),
        'signup': (context) => SignUp(),
        'homepage': (context) => HomePage(),
      },
    );
  }
}
