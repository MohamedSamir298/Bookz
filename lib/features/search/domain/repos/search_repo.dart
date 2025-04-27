import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dio/error/failures.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks(SearchRequestEntity entity);
}