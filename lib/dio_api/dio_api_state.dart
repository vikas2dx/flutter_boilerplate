import 'package:flutter_boilerplate/dio_api/dio_api_model.dart';

abstract class DioApiState {}

class SuccessState extends DioApiState {
  final List<ProductDio> products;
  SuccessState({required this.products});
}

class LoadingState extends DioApiState {}

class InitialState extends DioApiState {}

class ErrorState extends DioApiState {
  final String message;

  ErrorState({required this.message});
}
