import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/routes/routes_names.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Boilerplate')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dio API'),
            subtitle: const Text('Basic API call using Dio + Bloc'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(RoutesName.dioApi);
            },
          ),

          ListTile(
            title: const Text('Dio Pagination'),
            subtitle: const Text('Pagination using Dio + Bloc'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(RoutesName.dioPagination);
            },
          ),
          ListTile(
            title: const Text('Load Json Assets'),
            subtitle: const Text('Load json assets and Display'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(RoutesName.loadJsonAssets);
            },
          ),
          ListTile(
            title: const Text('FutureBuilder Api Call'),
            subtitle: const Text('Dio API call and load using FutureBuilder'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(RoutesName.futureBuilderDio);
            },
          ),

          ListTile(
            title: const Text('Provdier Api Call'),
            subtitle: const Text('Provider API call using Dio'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.pushNamed(RoutesName.providerApiCall);
            },
          ),
        ],
      ),
    );
  }
}
