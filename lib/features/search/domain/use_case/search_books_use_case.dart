
import 'package:bookz_app/features/search/domain/entities/search_request_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dio/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../repos/search_repo.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, SearchRequestEntity> {
  final SearchRepo searchRepo;
  SearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(SearchRequestEntity entity) {
    return searchRepo.searchBooks(entity);
  }
}
