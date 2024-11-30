import 'package:flutter/material.dart';
import 'constns/home_constants.dart';
import 'constns/color_text_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: border_color, // Color of the top border
                width: 1.0, // Thickness of the top border
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0), // Radius for top-left corner
              topRight: Radius.circular(25.0), // Radius for top-right corner
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0), // Radius for top-left corner
              topRight: Radius.circular(25.0), // Radius for top-right corner
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: primary_color,
              unselectedItemColor: border_color,
              onTap: _onItemTapped,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary_color,
          child: const Icon(
            Icons.help,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('chatbot');
          },
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
