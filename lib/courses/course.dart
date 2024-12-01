import 'package:flutter/material.dart';
import 'api_key_google_console.dart';
import 'course_type.dart';
import '../constns/color_text_size.dart';
import '../widgets/category.dart';

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
    const CourseType(
        courseTitle: 'UI & UX Essentials',
        courseDuration: '2 h 30 min',
        courseDescription: 'UI/UX Essentials',
        courseImageUrl: 'assets/images/9.png',
        coursePrice: '50',
        coursePlaylistId: 'PL0lNJEnwfVVOQ8qKmLoT7tLdTDKhEDzmG'),
    const CourseType(
        courseTitle: 'UI & UX',
        courseDuration: '2 h',
        courseDescription: 'Learn UI & UX for beginners',
        courseImageUrl: 'assets/images/10.png',
        coursePrice: '50',
        coursePlaylistId: 'PLmQ0KfqeaHAuud_Aav-94nfToArf6Uh4K'),
    const CourseType(
        courseTitle: 'HTML',
        courseDuration: '4 h',
        courseDescription: 'Learn HTML from scratch',
        courseImageUrl: 'assets/images/11.png',
        coursePrice: '50',
        coursePlaylistId: 'PLDoPjvoNmBAw_t_XWUFbBX-c9MafPk9ji'),
    const CourseType(
        courseTitle: 'CSS tutorials',
        courseDuration: '12 h',
        courseDescription: 'Learn CSS for beginners',
        courseImageUrl: 'assets/images/13.png',
        coursePrice: '50',
        coursePlaylistId: 'PL0Zuz27SZ-6Mx9fd9elt80G1bPcySmWit'),
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
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // 90% width
              child: Padding(
                //padding: const EdgeInsets.only(bottom: 20, top: 15),
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search course',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: border_color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: warning_color),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9, // 90% width
                child: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: CarouselExample(),
                )),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9, // 90% width
                child: ListView.builder(
                  //padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filteredCourses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: _filteredCourses[index],
                    ); // Directly return the course
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
