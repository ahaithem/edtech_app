import 'package:flutter/material.dart';
import 'video.dart';
import 'youtube_service.dart';
import 'video_player_screen.dart';
import '../widgets/app_bar.dart';

class VideoListScreen extends StatefulWidget {
  final String playlistId;
  final String apiKey;

  const VideoListScreen({
    super.key,
    required this.playlistId,
    required this.apiKey,
  });

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
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(title: 'Course Videos'),
        ),
        body: FutureBuilder<List<Video>>(
          future: _videosFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Error loading videos: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No videos found"));
            }

            final videos = snapshot.data!;
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: video.thumbnailUrl.isNotEmpty
                        ? Image.network(video.thumbnailUrl)
                        : const Icon(Icons.video_library),
                    title: Text(video.title),
                    onTap: () {
                      // Navigate to the video player screen when a video is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoId: video.videoId,
                            videoTitle: video.title,
                            allVideos: videos, // Pass the entire list of videos
                            initialIndex:
                                index, // Pass the index of the clicked video
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
