// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DioPaginationModel _$DioPaginationModelFromJson(Map<String, dynamic> json) =>
    DioPaginationModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductPagination.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$DioPaginationModelToJson(DioPaginationModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

ProductPagination _$ProductPaginationFromJson(Map<String, dynamic> json) =>
    ProductPagination(
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$ProductPaginationToJson(ProductPagination instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
