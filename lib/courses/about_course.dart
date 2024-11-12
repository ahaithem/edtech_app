import 'package:flutter/material.dart';
import 'video_list_screen.dart';
import '../constns/color_text_size.dart';
import 'api_key_google_console.dart';

class AboutCourse extends StatelessWidget {
  final String courseTitle;
  final String imageUrl;
  final String duration;
  final String aboutCourse;
  final String coursePrice;
  final String coursePlaylistId;
  const AboutCourse(
      {super.key,
      required this.courseTitle,
      required this.imageUrl,
      required this.duration,
      required this.aboutCourse,
      required this.coursePrice,
      required this.coursePlaylistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  // color:
                  //   Color(0xFFF8F2EE), // Background color for image and text
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        imageUrl,
                      ),
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
                    ]),
              )
            ]),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // 90% width
              child: Center(
                child: Text(
                  courseTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // 90% width
              child: Center(
                child: Text(
                  aboutCourse,
                  style: TextStyle(
                    color: text_color,
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // 90% width
              child: Center(
                child: Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.7, // Match the Swiper width
                child: MaterialButton(
                  color: primary_color, // Background color
                  textColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    // Optional: to make the corners round
                    borderRadius: BorderRadius.circular(16),
                  ),
                  //minWidth: double.infinity, // Width of the button
                  height: 56, // Height of the button
                  onPressed: () {
                    // Navigate to VideoListScreen with playlistId and apiKey
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoListScreen(
                          playlistId: coursePlaylistId,
                          apiKey: API_KEY,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Go to the course',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
