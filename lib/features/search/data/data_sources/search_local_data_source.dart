import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> searchBooks(SearchRequestEntity entity);
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  // @override
  // List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
  //   int startIndex = pageNumber * 10;
  //   int endIndex = (pageNumber + 1) * 10;
  //
  //   var box = Hive.box<BookEntity>(kFeaturedBox);
  //   int length = box.values.length;
  //   if (startIndex >= length || endIndex > length) {
  //     return [];
  //   }
  //   return box.values.toList().sublist(startIndex, endIndex);
  // }

  @override
  List<BookEntity> searchBooks(SearchRequestEntity entity) {
    var box1 = Hive.box<BookEntity>(AppConstants.hivePopularBoxName);
    var box2 = Hive.box<BookEntity>(AppConstants.hiveSearchBoxName);

    List<BookEntity> foundBooks = [];

    for (var book in box1.values) {
      if (book.bookTitle.toLowerCase().contains(entity.keyword.toLowerCase())) {
        foundBooks.add(book);
      }
    }

    for (var book in box2.values) {
      if (book.bookTitle.toLowerCase().contains(entity.keyword.toLowerCase())) {
        foundBooks.add(book);
      }
    }

    return foundBooks;
    // int length = box.values.length;
    //   if (startIndex >= length || endIndex > length) {
    //     return [];
    //   }
    //   return box.values.toList().sublist(startIndex, endIndex);
  }
}
