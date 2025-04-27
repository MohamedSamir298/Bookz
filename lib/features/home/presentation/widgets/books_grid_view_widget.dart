import 'package:bookz_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../search/presentation/cubit/search_cubit.dart';
import '../cubit/home_cubit.dart';
import 'grid_view_book_item_widget.dart';

class BooksGridViewWidget extends StatelessWidget {
  final bool isSearch;
  final state;
  final List<BookEntity> books;
  const BooksGridViewWidget({required this.books, required this.state, this.isSearch = false, super.key});

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
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 5 / 8,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              BookEntity book = books[index];
              return GridViewBookItem(book: book);
            },
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
