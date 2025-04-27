import 'package:bookz_app/core/constants/app_constants.dart';
import 'package:bookz_app/core/dio/end_points.dart';
import 'package:bookz_app/features/home/domain/entities/book_entity.dart';
import 'package:bookz_app/features/search/data/models/search_request_model.dart';
import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';

import '../../../../core/base_models/base_model.dart';
import '../../../../core/dio/api_consumer.dart';
import '../../../../core/functions/save_books.dart';
import '../../../../core/services/services_locator.dart';
import '../../../home/data/models/book_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks(SearchRequestEntity entity);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer apiConsumer = sl<ApiConsumer>();

  @override
  Future<List<BookEntity>> searchBooks(SearchRequestEntity entity) async {
    Map<String, dynamic> params = SearchRequestModel(keyword: entity.keyword, pageNumber: entity.pageNumber).toJson();
    try {
      var response = await apiConsumer.get(EndPoints.getBooks, queryParameters: params);
      var books = BaseModel<BookModel>.fromJsonWithModel(
        response.data,
        fromJson: (List<dynamic> jsonList) {
          return jsonList.map((json) => BookModel.fromJson(json as Map<String, dynamic>)).toList();
        },
      );
      saveBooksData(books.results, AppConstants.hiveSearchBoxName);
      return books.results;
    } catch (e) {
      return [];
    }
  }
}
