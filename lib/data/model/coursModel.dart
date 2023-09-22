class CoursModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String? channelTitle;

  CoursModel(
      {required this.id,
      required this.title,
      required this.thumbnailUrl,
      this.channelTitle});

  factory CoursModel.fromMap(Map<String, dynamic> snippet) {
    return CoursModel(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
