import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/course_icon.png'),
          ),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/profile_icon.png'),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/setting_icon.png'),
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: primary_color, // Color when selected
      unselectedItemColor: subtitle_color, // Color when unselected
      onTap: _onItemTapped,
    );
  }
}
