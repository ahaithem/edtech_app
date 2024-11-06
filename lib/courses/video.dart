class Video {
  final String videoId; // The ID of the video
  final String title; // The title of the video
  final String thumbnailUrl; // The URL of the video's thumbnail

  // Constructor to initialize the video properties
  Video({
    required this.videoId,
    required this.title,
    required this.thumbnailUrl,
  });

  // Factory constructor to create a Video instance from a JSON object
  factory Video.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet']; // Extract the snippet part of the JSON
    return Video(
      videoId: snippet?['resourceId']?['videoId'] ??
          '', // Extract the video ID or use an empty string if not available
      title: snippet?['title'] ??
          'No Title', // Extract the title or use 'No Title' if not available
      thumbnailUrl: snippet?['thumbnails']?['default']?['url'] ??
          '', // Extract the thumbnail URL or use an empty string if not available
    );
  }
}
