import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// This screen displays a YouTube video player
class VideoPlayerScreen extends StatefulWidget {
  final String videoId; // The ID of the YouTube video to be played
  final String videoTitle; // The title of the YouTube video

  // Constructor to initialize the videoId and videoTitle
  VideoPlayerScreen({required this.videoId, required this.videoTitle});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller; // Controller for the YouTube player

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube player controller with the video ID and settings
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId, // Set the initial video ID
      flags: YoutubePlayerFlags(
        autoPlay: true, // Automatically play the video when the player loads
        mute: false, // Do not mute the video
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.videoTitle)), // App bar with video title
      body: YoutubePlayer(
        controller: _controller, // The controller for the YouTube player
        showVideoProgressIndicator: true, // Show the video progress indicator
        progressIndicatorColor:
            Colors.red, // Set the color of the progress indicator to red
      ),
    );
  }
}
