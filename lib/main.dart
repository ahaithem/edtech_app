import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/first_screen.dart';
import './screens/learn_any_time.dart';
import './screens/log_in.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
      routes: {
        'learnanytime': (context) => LearnAnyTime(),
        'login': (context) => LogIn()
      },
    );
  }
}
