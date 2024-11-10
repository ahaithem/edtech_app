import 'package:flutter/material.dart';
import 'video_list_screen.dart'; // Import VideoListScreen
import 'api_key_google_console.dart';
import '../constns/color_text_size.dart';
import 'course_type.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  // Replace these with your actual API key and playlist ID
  final String apiKey = API_KEY;
  //final String playlistId = PLAYLIST_ID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CourseType(
                  courseTitle: 'Flutter',
                  courseDuration: '3 h 30 min',
                  courseDescription: 'Advanced Flutter course',
                  courseImageUrl: 'assets/images/13.png',
                  coursePrice: '50',
                  coursePlaylistId: 'PL93xoMrxRJIviJiC76oO5aV8bDp2s3OrA'),
              Container(
                height: 20,
              ),
              const CourseType(
                  courseTitle: 'Python',
                  courseDuration: '33 h 30 min',
                  courseDescription: 'Bigner Python course',
                  courseImageUrl: 'assets/images/8.png',
                  coursePrice: '50',
                  coursePlaylistId: 'PLIhvC56v63ILPDA2DQBv0IKzqsWTZxCkp'),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
