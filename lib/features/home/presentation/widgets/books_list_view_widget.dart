import 'package:bookz_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors_constants.dart';
import '../../../search/presentation/cubit/search_cubit.dart';
import '../cubit/home_cubit.dart';
import 'list_view_book_item_widget.dart';

class BooksListViewWidget extends StatelessWidget {
  final bool isSearch;
  final state;
  final List<BookEntity> books;
  const BooksListViewWidget({required this.books, required this.state, this.isSearch = false, super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollEndNotification &&
            scrollNotification.metrics.axisDirection == AxisDirection.down &&
            scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent * 0.8 &&
            !state.isPaginationLoading) {
          isSearch
              ? context.read<SearchCubit>().searchBooks(keyword: state.searchKeyword, pageNumber: state.currentPage + 1)
              : context.read<HomeCubit>().fetchHomePopularBooks(pageNumber: state.currentPage + 1);
        }
        return false;
      },
      child: Stack(
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              BookEntity book = books[index];
              return ListViewBookItem(book: book);
            },
            itemCount: books.length,
            separatorBuilder: (context, index) => Divider(height: 20.h, thickness: 1, color: ColorsConstants.kTertiaryColor1),
          ),
          if (state.isPaginationLoading)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(child: CupertinoActivityIndicator()),
            ),
        ],
      ),
    );
  }
}
