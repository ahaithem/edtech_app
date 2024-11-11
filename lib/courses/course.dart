import 'package:flutter/material.dart';
import 'api_key_google_console.dart';
import 'course_type.dart';
import '../constns/color_text_size.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final String apiKey = API_KEY;
  final TextEditingController _searchController = TextEditingController();
  final List<CourseType> _courses = [
    const CourseType(
        courseTitle: 'Flutter',
        courseDuration: '3 h 30 min',
        courseDescription: 'Advanced Flutter course',
        courseImageUrl: 'assets/images/13.png',
        coursePrice: '50',
        coursePlaylistId: 'PL93xoMrxRJIviJiC76oO5aV8bDp2s3OrA'),
    const CourseType(
        courseTitle: 'Python',
        courseDuration: '33 h 30 min',
        courseDescription: 'Beginner Python course',
        courseImageUrl: 'assets/images/8.png',
        coursePrice: '50',
        coursePlaylistId: 'PLIhvC56v63ILPDA2DQBv0IKzqsWTZxCkp'),
  ];
  List<CourseType> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _filteredCourses = _courses;
    _searchController.addListener(_filterCourses);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCourses = _courses.where((course) {
        return course.courseTitle.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9, // 90% width
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search course',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: border_color), // border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: warning_color), // Focused border color
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ..._filteredCourses.map((course) => Column(
                    children: [
                      course,
                      const SizedBox(height: 20),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
