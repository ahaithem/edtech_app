import 'package:flutter/material.dart';
import './screens/first_screen.dart';
import './screens/learn_any_time.dart';

void main() {
  runApp(const MyApp());
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
      },
    );
  }
}
