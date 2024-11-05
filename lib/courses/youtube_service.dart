// youtube_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'video.dart';

class YouTubeService {
  final String apiKey;

  YouTubeService(this.apiKey);

  Future<List<Video>> fetchVideosFromPlaylist(String playlistId) async {
    final url = 'https://www.googleapis.com/youtube/v3/playlistItems'
        '?part=snippet&maxResults=10&playlistId=$playlistId&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final items = data['items'] as List;
      return items.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load videos: ${response.statusCode}');
    }
  }
}
