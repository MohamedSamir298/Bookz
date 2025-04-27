import 'package:bookz_app/core/constants/app_constants.dart';
import 'package:bookz_app/core/dio/end_points.dart';
import 'package:bookz_app/features/home/domain/entities/book_entity.dart';

import '../../../../core/base_models/base_model.dart';
import '../../../../core/dio/api_consumer.dart';
import '../../../../core/functions/save_books.dart';
import '../../../../core/services/services_locator.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchHomePopularBooks({int pageNumber = 1});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer = sl<ApiConsumer>();

  @override
  Future<List<BookEntity>> fetchHomePopularBooks({int pageNumber = 1}) async {
    Map<String, dynamic> params = {'page': pageNumber};
    try {
      var response = await apiConsumer.get(EndPoints.getBooks, queryParameters: params);
      var books = BaseModel<BookModel>.fromJsonWithModel(
        response.data,
        fromJson: (List<dynamic> jsonList) {
          return jsonList.map((json) => BookModel.fromJson(json as Map<String, dynamic>)).toList();
        },
      );

      // save to both boxes to use on search offline
      saveBooksData(books.results, AppConstants.hivePopularBoxName);
      return books.results;
    } catch (e) {
      return [];
    }
  }
}
