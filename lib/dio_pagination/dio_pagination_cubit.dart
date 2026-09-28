import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_model.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_state.dart';

class DioPaginationCubit extends Cubit<DioPaginationState> {
  DioPaginationCubit() : super(InitialState());

  final dio =
      Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            sendTimeout: const Duration(seconds: 5),
          ),
        )
        ..interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            requestUrl: true,
          ),
        );
  static const int limit = 10;
  Future<void> getProducts() async {
    emit(LoadingState());
    try {
      final response = await dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'limit': limit, 'skip': 0},
      );

      final productResponse = DioPaginationModel.fromJson(response.data);

      final hasReachedMax =
          (productResponse.skip + productResponse.products.length) >=
          productResponse.total;

      emit(
        SuccessState(
          products: productResponse.products,
          isMoreLoading: false,
          hasReachedMax: hasReachedMax,
          total: productResponse.total,
          skip: productResponse.skip,
        ),
      );
    } on DioException catch (e) {
      emit(ErrorState(message: 'Network Error'));
      debugPrint(e.message.toString());
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong'));
      debugPrint(e.toString());
    }
  }

  Future<void> loadMore() async {
    final currentState = state;

    if (currentState is! SuccessState) return;

    if (currentState.hasReachedMax || currentState.isMoreLoading) {
      return;
    }

    final nextSkip = currentState.skip + limit;

    emit(currentState.copyWith(isMoreLoading: true));

    try {
      final response = await dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'limit': limit, 'skip': nextSkip},
      );

      final productResponse = DioPaginationModel.fromJson(response.data);

      final hasReachedMax =
          (productResponse.skip + productResponse.products.length) >=
          productResponse.total;

      emit(
        currentState.copyWith(
          products: [...currentState.products, ...productResponse.products],
          hasReachedMax: hasReachedMax,
          isMoreLoading: false,
          total: productResponse.total,
          skip: nextSkip,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(isMoreLoading: false));
    }
  }
}
