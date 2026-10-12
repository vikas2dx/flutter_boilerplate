import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_model.dart';

class DioApiDetailsScreen extends StatelessWidget {
  final ProductDio products;
  const DioApiDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details Page")),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
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
