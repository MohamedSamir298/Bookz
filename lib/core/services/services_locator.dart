import 'package:bookz_app/core/dio/api_consumer.dart';
import 'package:bookz_app/core/dio/dio_consumer.dart';
import 'package:bookz_app/core/services/hive_cache_services.dart';
import 'package:bookz_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookz_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookz_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookz_app/features/home/domain/repos/home_repo.dart';
import 'package:bookz_app/features/home/domain/use_case/fetch_home_popular_books_use_case.dart';
import 'package:bookz_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookz_app/features/search/data/repos/search_repo_impl.dart';
import 'package:bookz_app/features/search/domain/repos/search_repo.dart';
import 'package:bookz_app/features/search/domain/use_case/search_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/search/data/data_sources/search_local_data_source.dart';
import 'connectivity_services.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());
  sl.registerLazySingleton(() => HiveServices());
  sl.registerLazySingleton(() => ConnectivityServiceCubit());

  final customInstance = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1), // Custom check timeout
    checkInterval: const Duration(seconds: 1), // Custom check interval
  );
  sl.registerSingleton<InternetConnectionChecker>(customInstance);

  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  sl.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl());
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  sl.registerLazySingleton(() => FetchHomePopularBooksUseCase(sl<HomeRepo>()));

  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl());
  sl.registerLazySingleton<SearchLocalDataSource>(() => SearchLocalDataSourceImpl());
  sl.registerLazySingleton<SearchRepo>(() => SearchRepoImpl());
  sl.registerLazySingleton(() => SearchBooksUseCase(sl<SearchRepo>()));
}
