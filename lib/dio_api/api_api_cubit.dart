import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_model.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_state.dart';

class DioApiCubit extends Cubit<DioApiState> {
  DioApiCubit() : super(InitialState());

  Future<void> getProducts() async {
    final dio =
        Dio(
            BaseOptions(
              connectTimeout: Duration(seconds: 5),
              receiveTimeout: Duration(seconds: 5),
              sendTimeout: Duration(seconds: 5),
            ),
          )
          ..interceptors.add(
            LogInterceptor(
              requestBody: true,
              requestUrl: true,
              responseBody: true,
            ),
          );

    emit(LoadingState());

    try {
      final response = await dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'limit': 10},
      );

      final ProductModel productModel = ProductModel.fromJson(response.data);

      if (productModel.products.isEmpty) {
        emit(ErrorState(message: "No Products Available"));
        return;
      }

      emit(SuccessState(products: productModel.products));
    } on DioException catch (e) {
      emit(ErrorState(message: 'Network Error'));
      debugPrint(e.message.toString());
    } catch (e) {
      emit(ErrorState(message: "Something went wrong"));
      debugPrint(e.toString());
    }
  }
}
