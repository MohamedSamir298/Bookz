import 'package:bookz_app/core/services/connectivity_services.dart';
import 'package:bookz_app/core/services/hive_cache_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/ui_helpers/custom_shared_widgets/custom_print.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/use_case/fetch_home_popular_books_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> refreshHomePopularBooks() async {
    try {
      if (!await sl<ConnectivityServiceCubit>().connectionChecker.hasConnection) return;
      await sl<HiveServices>().clearPopularBox();
      await fetchHomePopularBooks(pageNumber: 1);
    } catch (e) {
      ePrint(e);
    }
  }

  Future<void> fetchHomePopularBooks({int pageNumber = 1}) async {
    if (state.isLoading || state.isPaginationLoading || !state.hasMore) return;
    final isPagination = pageNumber > 1;
    emit(state.copyWith(isLoading: !isPagination, isPaginationLoading: isPagination));

    try {
      final books = await sl<FetchHomePopularBooksUseCase>().call(pageNumber);
      books.fold(
        (l) {
          ePrint("Error fetching books: $l");
        },
        (r) {
          final List<BookEntity> newBooks = r;
          bool hasMore = newBooks.isNotEmpty;
          emit(
            state.copyWith(
              books: isPagination ? List.from(state.books..addAll(newBooks)) : newBooks,
              isLoading: false,
              isPaginationLoading: false,
              hasMore: hasMore,
              currentPage: state.currentPage + (isPagination ? 1 : 0),
            ),
          );
        },
      );
    } catch (e) {
      print("Error fetching home popular books: $e");
      emit(state.copyWith(isLoading: false, isPaginationLoading: false));
    }
  }
}
