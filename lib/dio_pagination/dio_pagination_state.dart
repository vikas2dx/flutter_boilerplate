import 'package:flutter_boilerplate/dio_pagination/dio_pagination_model.dart';

abstract class DioPaginationState {}

class InitialState extends DioPaginationState {}

class LoadingState extends DioPaginationState {}

class SuccessState extends DioPaginationState {
  final List<ProductPagination> products;
  final bool isMoreLoading;
  final bool hasReachedMax;
  final int total;
  final int skip;
  SuccessState({
    required this.products,
    required this.isMoreLoading,
    required this.hasReachedMax,
    required this.total,
    required this.skip,
  });

  SuccessState copyWith({
    List<ProductPagination>? products,
    bool? isMoreLoading,
    bool? hasReachedMax,
    int? total,
    int? skip,
  }) {
    return SuccessState(
      products: products ?? this.products,
      isMoreLoading: isMoreLoading ?? this.isMoreLoading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      total: total ?? this.total,
      skip: skip ?? this.skip,
    );
  }
}

class ErrorState extends DioPaginationState {
  final String message;

  ErrorState({required this.message});
}
