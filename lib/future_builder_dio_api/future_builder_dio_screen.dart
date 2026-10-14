import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/future_builder_dio_api/posts_model.dart';

class FutureBuilderDioScreen extends StatefulWidget {
  const FutureBuilderDioScreen({super.key});

  @override
  State<FutureBuilderDioScreen> createState() => _FutureBuilderDioScreenState();
}

class _FutureBuilderDioScreenState extends State<FutureBuilderDioScreen> {
  late Future<List<PostsModel>> _future;

  @override
  void initState() {
    super.initState();
    _future = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FutureBuilder Screen")),

      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final posts = snapshot.data;

          if (posts == null || posts.isEmpty) {
            return const Center(child: Text("No post availbale"));
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<PostsModel>> getPosts() async {
    final response = await Dio().get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    return (response.data as List)
        .map((post) => PostsModel.fromJson(post))
        .toList();
  }
}
