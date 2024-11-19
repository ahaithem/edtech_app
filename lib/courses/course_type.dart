import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';
import 'about_course.dart';

class CourseType extends StatelessWidget {
  final String courseTitle;
  final String courseDuration;
  final String courseDescription;
  final String courseImageUrl;
  final String coursePrice;
  final String coursePlaylistId;
  const CourseType({
    required this.courseTitle,
    required this.courseDuration,
    required this.courseDescription,
    required this.courseImageUrl,
    required this.coursePrice,
    required this.coursePlaylistId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to VideoListScreen with playlistId and apiKey
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => VideoListScreen(
        //       playlistId: coursePlaylistId,
        //       apiKey: API_KEY,
        //     ),
        //   ),
        // );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AboutCourse(
                    courseTitle: courseTitle,
                    imageUrl: courseImageUrl,
                    duration: courseDuration,
                    aboutCourse:
                        "You can launch a new career in web develop-ment today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.",
                    coursePrice: coursePrice,
                    coursePlaylistId: coursePlaylistId)));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // 90% width
        child: Container(
          //padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: border_color, // Color of the border
              width: 2.0, // Thickness of the border
            ),
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color:
                      Color(0xFFF8F2EE), // Background color for image and text
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(courseImageUrl),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color:
                            secondary_color, // Background color for image and text
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Text('\$$coursePrice',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseDuration,
                        style: TextStyle(color: success_color),
                      ),
                      Text(
                        courseTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: text_color,
                        ),
                      ),
                      Text(
                        courseDescription,
                        style: TextStyle(color: text_color),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
