import 'package:flutter_boilerplate/core/routes/routes_names.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_details_screen.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_model.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_screen.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_details_screen.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_model.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_screen.dart';
import 'package:flutter_boilerplate/load_json_assets/load_json_assets_screen.dart';
import 'package:flutter_boilerplate/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RoutesName.main,
      builder: (context, state) => const MainScreen(),
    ),

    GoRoute(
      path: '/dioApi',
      name: RoutesName.dioApi,
      builder: (context, state) => const DioApiScreen(),
    ),

    GoRoute(
      path: '/dioApiDetails',
      name: RoutesName.dioApiDetails,
      builder: (context, state) {
        final products = state.extra as ProductDio;

        return DioApiDetailsScreen(products: products);
      },
    ),

    GoRoute(
      path: '/dioPagination',
      name: RoutesName.dioPagination,
      builder: (context, state) => const DioPaginationScreen(),
    ),

    GoRoute(
      path: '/dioPaginationDetails',
      name: RoutesName.dioPaginationDetails,
      builder: (context, state) {
        final products = state.extra as ProductPagination;

        return DioPaginationDetailsScreen(products: products);
      },
    ),

    GoRoute(
      path: '/loadJsonAssets',
      name: RoutesName.loadJsonAssets,
      builder: (context, state) => LoadJsonAssetsScreen(),
    ),
  ],
);
