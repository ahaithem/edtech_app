import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% width
                child: Container(
                  padding: EdgeInsets.all(40.0), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Text(
                    'Hello World',
                    textAlign: TextAlign.center, // Center text horizontally
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Spacing between containers
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% width
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    'Hello World',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Spacing between containers
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% width
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    'Hello World',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
