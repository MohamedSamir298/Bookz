import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/dio/error/failures.dart';
import '../../../../core/services/services_locator.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource = sl<HomeRemoteDataSource>();
  final HomeLocalDataSource homeLocalDataSource = sl<HomeLocalDataSource>();

  @override
  Future<Either<Failure, List<BookEntity>>> fetchHomePopularBooks({int pageNumber = 1}) async {
    List<BookEntity> booksList;
    try {
      if(pageNumber == 1) {
        booksList = homeLocalDataSource.fetchHomePopularBooks(
          pageNumber: pageNumber,
        );
        if (booksList.isNotEmpty) {
          return right(booksList);
        }
      }

      booksList = await homeRemoteDataSource.fetchHomePopularBooks(pageNumber: pageNumber);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.response!.data['error']));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
