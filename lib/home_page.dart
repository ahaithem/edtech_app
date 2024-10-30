import 'package:flutter/material.dart';
import './widgets/bottom_app_bar.dart';
import './widgets/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: const Profile(),
        bottomNavigationBar: const BottomNavigationBarExample());
  }
}
