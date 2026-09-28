import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_cubit.dart';
import 'package:flutter_boilerplate/dio_pagination/dio_pagination_state.dart';

class DioPaginationScreen extends StatefulWidget {
  const DioPaginationScreen({super.key});

  @override
  State<DioPaginationScreen> createState() => _DioPaginationScreenState();
}

class _DioPaginationScreenState extends State<DioPaginationScreen> {
  final _scrollController = ScrollController();

  final _dioPaginationCubit = DioPaginationCubit();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    _dioPaginationCubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dioPaginationCubit,
      child: Scaffold(
        body: BlocBuilder<DioPaginationCubit, DioPaginationState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const SizedBox.shrink();
            }

            if (state is ErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SuccessState) {
              return ListView.builder(
                controller: _scrollController,
                itemCount:
                    state.products.length + (state.isMoreLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.products.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final product = state.products[index];

                  return ListTile(
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

  void _onScroll() {
    final position = _scrollController.position;

    if (position.pixels > position.maxScrollExtent - 200) {
      _dioPaginationCubit.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    _dioPaginationCubit.close();

    super.dispose();
  }
}
