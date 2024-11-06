import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For making HTTP requests
import 'video.dart'; // Import the Video model

// Service class to interact with YouTube API
class YouTubeService {
  final String apiKey; // API key for YouTube Data API

  // Constructor to initialize the API key
  YouTubeService(this.apiKey);

  // Fetch videos from a YouTube playlist
  Future<List<Video>> fetchVideosFromPlaylist(String playlistId) async {
    // Construct the URL for the API request
    final url =
        'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=$playlistId&key=$apiKey';

    // Make the HTTP GET request
    final response = await http.get(Uri.parse(url));

    // Check if the response status is OK
    if (response.statusCode == 200) {
      // Decode the JSON response
      final data = json.decode(response.body);

      // Check if the items list is empty or null
      if (data['items'] == null || data['items'].isEmpty) {
        throw Exception("No videos found in the playlist.");
      }

      // Map the JSON items to Video objects and return the list
      return (data['items'] as List)
          .map((item) => Video.fromJson(item))
          .toList();
    } else {
      // Throw an exception if the request failed
      throw Exception("Failed to load videos: ${response.statusCode}");
    }
  }
}
