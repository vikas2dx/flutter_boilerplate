import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/routes/routes_names.dart';
import 'package:flutter_boilerplate/dio_api/api_api_cubit.dart';
import 'package:flutter_boilerplate/dio_api/dio_api_state.dart';
import 'package:go_router/go_router.dart';

class DioApiScreen extends StatelessWidget {
  const DioApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DioApiCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Dio API call")),
        body: BlocBuilder<DioApiCubit, DioApiState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const SizedBox.shrink();
            }

            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is SuccessState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    onTap: () {
                      context.pushNamed(
                        RoutesName.dioApiDetails,
                        extra: product,
                      );
                    },
                    leading: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(product.thumbnail),
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.description),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
