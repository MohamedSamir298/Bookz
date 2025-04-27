import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';
import 'package:bookz_app/features/search/domain/use_case/search_books_use_case.dart';
import 'package:bookz_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/connectivity_services.dart';
import '../../../../core/services/hive_cache_services.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/ui_helpers/custom_shared_widgets/custom_print.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future<void> searchBooks({required String keyword, int pageNumber = 1}) async {
    //if(keyword == state.searchKeyword) return;
    state.searchKeyword = keyword;
    print(state.searchKeyword);
    if (state.isLoading || state.isPaginationLoading || !state.hasMore) return;
    final isPagination = pageNumber > 1;
    emit(state.copyWith(isLoading: !isPagination, isPaginationLoading: isPagination));

    try {
      final books = await sl<SearchBooksUseCase>().call(SearchRequestEntity(keyword: keyword, pageNumber: pageNumber));
      books.fold(
        (l) {
          ePrint("Error fetching books: $l");
        },
        (r) {
          bool hasMore = r.isNotEmpty;
          emit(
            state.copyWith(
              books: isPagination ? List.from(state.books!..addAll(r)) : r,
              isLoading: false,
              isPaginationLoading: false,
              hasMore: hasMore,
              currentPage: state.currentPage + (isPagination ? 1 : 0),
            ),
          );
        },
      );
    } catch (e) {
      print("Error fetching books: $e");
      emit(state.copyWith(isLoading: false, isPaginationLoading: false));
    }

    // try {
    //   emit(state.copyWith(isLoading: true));
    //   var books = await sl<SearchBooksUseCase>().call(SearchRequestEntity(keyword: keyword, pageNumber: pageNumber));
    //   books.fold((l) {}, (r) {
    //     emit(state.copyWith(isLoading: false, books: r));
    //   });
    // } catch (e) {
    //   ePrint(e);
    // }
  }
}
