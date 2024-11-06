import 'package:flutter/material.dart';
import 'video.dart';
import 'youtube_service.dart';
import 'video_player_screen.dart';

// This screen displays a list of videos from a YouTube playlist
class VideoListScreen extends StatefulWidget {
  final String playlistId; // The ID of the YouTube playlist
  final String apiKey; // The API key for accessing YouTube Data API

  // Constructor to initialize the playlistId and apiKey
  VideoListScreen({required this.playlistId, required this.apiKey});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Future<List<Video>> _videosFuture; // Future to hold the list of videos
  late YouTubeService _youtubeService; // Service to fetch videos from YouTube

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube service with the provided API key
    _youtubeService = YouTubeService(widget.apiKey);
    // Fetch the videos from the specified playlist
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
            // Show a loading indicator while waiting for the videos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if there was an error fetching the videos
            return Center(
                child: Text("Error loading videos: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show a message if no videos were found
            return Center(child: Text("No videos found"));
          }

          final videos = snapshot.data!;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              // Show the list of videos
              final video = videos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  // leading: Image.network(video.thumbnailUrl),
                  leading:
                      video.thumbnailUrl.isNotEmpty // Video thumbnail available
                          ? Image.network(video.thumbnailUrl)
                          : Icon(Icons.video_library),
                  title: Text(video.title),
                  onTap: () {
                    // Navigate to the video player screen when a video is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                            videoId: video.videoId, videoTitle: video.title),
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
