import 'package:dartz/dartz.dart';
import '../../../../core/dio/error/failures.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchHomePopularBooks({int pageNumber});
}