import 'package:bookz_app/core/services/connectivity_services.dart';
import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/dio/error/failures.dart';
import '../../../../core/services/services_locator.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../../domain/repos/search_repo.dart';
import '../data_sources/search_local_data_source.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource = sl<SearchRemoteDataSource>();
  final SearchLocalDataSource searchLocalDataSource = sl<SearchLocalDataSource>();

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks(SearchRequestEntity entity) async {
    List<BookEntity> booksList;
    try {
      if (!await sl<ConnectivityServiceCubit>().connectionChecker.hasConnection) {
        booksList = searchLocalDataSource.searchBooks(entity);
        if (booksList.isNotEmpty) {
          return right(booksList);
        } else {
          return right([]);
        }
      }

      booksList = await searchRemoteDataSource.searchBooks(entity);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.response!.data['error']));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
