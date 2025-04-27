import 'package:equatable/equatable.dart';

import '../../domain/entities/book_entity.dart';

final class HomeState extends Equatable {
  List<BookEntity> books;
  bool isLoading;
  bool hasMore;
  int currentPage;
  bool isPaginationLoading;

  HomeState({this.books = const [], this.isLoading = false, this.hasMore = true, this.currentPage = 1, this.isPaginationLoading = false});

  HomeState copyWith({List<BookEntity>? books, bool? isLoading, bool? hasMore, int? currentPage, bool? isPaginationLoading}) {
    return HomeState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
    );
  }

  @override
  List<Object?> get props => [books, isLoading, hasMore, currentPage, isPaginationLoading];
}
