// video.dart
class Video {
  final String videoId;
  final String title;
  final String thumbnailUrl;

  Video({
    required this.videoId,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final resourceId = snippet['resourceId'];

    return Video(
      videoId: resourceId['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
    );
  }
}
