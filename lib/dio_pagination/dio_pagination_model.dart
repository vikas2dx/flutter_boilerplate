// To parse this JSON data, do
//
//     final dioPaginationModel = dioPaginationModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dio_pagination_model.g.dart';

DioPaginationModel dioPaginationModelFromJson(String str) =>
    DioPaginationModel.fromJson(json.decode(str));

String dioPaginationModelToJson(DioPaginationModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DioPaginationModel {
  @JsonKey(name: "products")
  final List<ProductPagination> products;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "skip")
  final int skip;
  @JsonKey(name: "limit")
  final int limit;

  DioPaginationModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory DioPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$DioPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DioPaginationModelToJson(this);
}

@JsonSerializable()
class ProductPagination {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "thumbnail")
  final String thumbnail;

  ProductPagination({
    required this.title,
    required this.description,

    required this.thumbnail,
  });

  factory ProductPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPaginationToJson(this);
}
