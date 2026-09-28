class DioApiModel {
  List<ProductDio> products;

  DioApiModel({required this.products});
  factory DioApiModel.fromJson(Map<String, dynamic> json) {
    return DioApiModel(
      products: (json['products'] as List)
          .map((json) => ProductDio.fromJson(json))
          .toList(),
    );
  }
}

class ProductDio {
  final String title;
  final String description;

  ProductDio({required this.title, required this.description});

  factory ProductDio.fromJson(Map<String, dynamic> json) =>
      ProductDio(title: json['title'], description: json['description']);
}
