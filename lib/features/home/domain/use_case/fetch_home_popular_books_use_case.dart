import 'package:bookz_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dio/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entity.dart';

class FetchHomePopularBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchHomePopularBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(int pageNumber) {
    return homeRepo.fetchHomePopularBooks(pageNumber: pageNumber);
  }
}
