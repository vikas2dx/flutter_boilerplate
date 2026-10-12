import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_model.dart';

class DioPaginationDetailsScreen extends StatelessWidget {
  final ProductPagination products;
  const DioPaginationDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product details")),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(products.thumbnail),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(products.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
