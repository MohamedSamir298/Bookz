import 'package:bookz_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookz_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_grid_view_widget.dart';
import 'books_list_view_widget.dart';

class ListGridBuilderWidget extends StatelessWidget {
  final bool isListView;

  const ListGridBuilderWidget({required this.isListView, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<HomeCubit>().refreshHomePopularBooks();
          },
          child:
              state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.books.isEmpty
                  ? const Center(child: Text('No Books Found'))
                  : isListView
                  ? BooksGridViewWidget(books: state.books, state: state)
                  : BooksListViewWidget(books: state.books, state: state),
        );
      },
    );
  }
}
