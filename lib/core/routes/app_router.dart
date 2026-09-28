import 'package:flutter_boilerplate/core/routes/routes_names.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_screen.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_screen.dart';
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
      path: '/dioPagination',
      name: RoutesName.dioPagination,
      builder: (context, state) => const DioPaginationScreen(),
    ),
  ],
);
