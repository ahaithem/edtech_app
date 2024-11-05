// video_list_screen.dart
import 'package:flutter/material.dart';
import 'youtube_service.dart';
import 'video.dart';
import 'video_player_screen.dart';

class VideoListScreen extends StatefulWidget {
  final String playlistId;
  final String apiKey;

  VideoListScreen({required this.playlistId, required this.apiKey});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Future<List<Video>> _videosFuture;
  late YouTubeService _youtubeService;

  @override
  void initState() {
    super.initState();
    _youtubeService = YouTubeService(widget.apiKey);
    _videosFuture = _youtubeService.fetchVideosFromPlaylist(widget.playlistId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Videos')),
      body: FutureBuilder<List<Video>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error loading videos: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No videos found"));
          }

          final videos = snapshot.data!;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(video.thumbnailUrl),
                  title: Text(video.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerScreen(videoId: video.videoId),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
