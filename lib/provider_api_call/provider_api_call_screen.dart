import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/provider_api_call/post_provider.dart';
import 'package:provider/provider.dart';

class ProviderApiCallScreen extends StatelessWidget {
  const ProviderApiCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider()..getPosts(),
      child: Scaffold(
        appBar: AppBar(title: Text('Provider API call')),
        body: Consumer<PostProvider>(
          builder: (context, state, child) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error.toString()));
            }

            if (state.posts.isNotEmpty) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
