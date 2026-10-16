class ProviderPostsModel {
  final String title;
  final String body;

  ProviderPostsModel({required this.title, required this.body});

  factory ProviderPostsModel.fromJson(Map<String, dynamic> json) {
    return ProviderPostsModel(title: json['title'], body: json['body']);
  }
}
