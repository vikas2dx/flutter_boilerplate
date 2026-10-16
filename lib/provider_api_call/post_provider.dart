import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/provider_api_call/provider_posts_model.dart';

class PostProvider extends ChangeNotifier {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  String? _error;
  bool _isLoading = false;
  List<ProviderPostsModel> _posts = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<ProviderPostsModel> get posts => _posts;
  Future<void> getPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await dio.get('/posts');

      List<ProviderPostsModel> posts = (response.data as List)
          .map((e) => ProviderPostsModel.fromJson(e))
          .toList();
      _posts = posts;
      if (_posts.isEmpty) {
        _error = "No Posts found";
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      _error = "Network Error";
    } catch (e) {
      debugPrint(e.toString());
      _error = "Something went wrong";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    dio.close();
    super.dispose();
  }
}
