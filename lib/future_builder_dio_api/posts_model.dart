class PostsModel {
  final String title;
  final String body;

  PostsModel({required this.title, required this.body});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(title: json['title'], body: json['body']);
  }
}
