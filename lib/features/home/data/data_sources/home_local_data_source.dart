import 'package:bookz_app/core/constants/app_constants.dart';
import 'package:hive_ce/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchHomePopularBooks({int pageNumber = 1});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
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
  List<BookEntity> fetchHomePopularBooks({int pageNumber = 1}) {
    var box = Hive.box<BookEntity>(AppConstants.hivePopularBoxName);
    return box.values.toList();
    // int length = box.values.length;
    //   if (startIndex >= length || endIndex > length) {
    //     return [];
    //   }
    //   return box.values.toList().sublist(startIndex, endIndex);
  }
}
