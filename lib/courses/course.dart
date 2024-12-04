import 'package:flutter/material.dart';
import 'api_key_google_console.dart';
import 'course_type.dart';
import '../constns/color_text_size.dart';
import '../widgets/category.dart';
import 'all_courses.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  // API key for accessing Google services
  final String apiKey = API_KEY;

  // Controller for the search text field
  final TextEditingController _searchController = TextEditingController();

  // List to hold the filtered courses
  List<CourseType> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered courses with all courses
    _filteredCourses = courses;
    // Add a listener to the search controller to filter courses as the user types
    _searchController.addListener(_filterCourses);
  }

  @override
  void dispose() {
    // Dispose the search controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }

  // Method to filter courses based on the search query
  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCourses = courses.where((course) {
        return course.courseTitle.toLowerCase().contains(query);
      }).toList();
    });
  }

  // Method to filter courses based on the selected category
  void _filterCoursesByCategory(String category) {
    setState(() {
      if (category == '#ALL') {
        // If the category is '#ALL', show all courses
        _filteredCourses = courses;
      } else {
        // Otherwise, filter courses by the selected category
        _filteredCourses = courses.where((course) {
          return course.courseTitle.toLowerCase().contains(
                category.substring(1).toLowerCase(),
              );
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Search text field
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search course',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: border_color),
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: warning_color),
                    ),
                  ),
                ),
              ),
            ),
            // Category carousel
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CarouselExample(
                  onCategorySelected: _filterCoursesByCategory,
                ),
              ),
            ),
            // List of filtered courses
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: _filteredCourses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: _filteredCourses[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
