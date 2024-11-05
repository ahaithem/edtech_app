import 'package:flutter/material.dart';
import 'video_list_screen.dart'; // Import VideoListScreen
import 'api_key_google_console.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  // Replace these with your actual API key and playlist ID
  final String apiKey = API_KEY;
  final String playlistId = PLAYLIST_ID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Course!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to VideoListScreen with playlistId and apiKey
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoListScreen(
                        playlistId: PLAYLIST_ID,
                        apiKey: API_KEY,
                      ),
                    ),
                  );
                },
                child: Text('View Course Videos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
