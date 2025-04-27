import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/book_entity.dart';

class SearchState extends Equatable {
  List<BookEntity>? books;
  bool isLoading;
  String searchKeyword;
  bool hasMore;
  int currentPage;
  bool isPaginationLoading;

  SearchState({
    this.books,
    this.isLoading = false,
    this.searchKeyword = '',
    this.hasMore = true,
    this.currentPage = 1,
    this.isPaginationLoading = false,
  });

  SearchState copyWith({
    List<BookEntity>? books,
    bool? isLoading,
    String? searchKeyword,
    bool? hasMore,
    int? currentPage,
    bool? isPaginationLoading,
  }) {
    return SearchState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
    );
  }

  @override
  List<Object?> get props => [books, isLoading, searchKeyword, hasMore, currentPage, isPaginationLoading];
}
