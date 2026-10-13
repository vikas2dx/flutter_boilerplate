import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/load_json_assets/item_model.dart';

class LoadJsonAssetsScreen extends StatefulWidget {
  const LoadJsonAssetsScreen({super.key});

  @override
  State<LoadJsonAssetsScreen> createState() => _LoadJsonAssetsScreenState();
}

class _LoadJsonAssetsScreenState extends State<LoadJsonAssetsScreen> {
  List<ItemModel> list = [];

  @override
  void initState() {
    super.initState();

    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Load from Json Assets")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          );
        },
      ),
    );
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/data.json');

    final itemsList = (jsonDecode(jsonString) as List)
        .map((item) => ItemModel.fromJson(item))
        .toList();

    setState(() {
      list = itemsList;
    });
  }
}
