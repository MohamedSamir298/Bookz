import 'package:bookz_app/features/home/presentation/cubit/home_state.dart';
import 'package:bookz_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookz_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/widgets/books_grid_view_widget.dart';
import '../../../home/presentation/widgets/books_list_view_widget.dart';

class SearchListGridBuilderWidget extends StatelessWidget {
  final bool isListView;
  const SearchListGridBuilderWidget({required this.isListView, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.books?.isEmpty ?? true
            ? const Center(child: Text('No Books Found'))
            : isListView
            ? BooksGridViewWidget(books: state.books!, state: state, isSearch: true)
            : BooksListViewWidget(books: state.books!, state: state, isSearch: true);
      },
    );
  }
}
