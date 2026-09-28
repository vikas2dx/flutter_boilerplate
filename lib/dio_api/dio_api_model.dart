class ProductModel {
  List<Products> products;

  ProductModel({required this.products});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: (json['products'] as List)
          .map((json) => Products.fromJson(json))
          .toList(),
    );
  }
}

class Products {
  final String title;
  final String description;

  Products({required this.title, required this.description});

  factory Products.fromJson(Map<String, dynamic> json) =>
      Products(title: json['title'], description: json['description']);
}
