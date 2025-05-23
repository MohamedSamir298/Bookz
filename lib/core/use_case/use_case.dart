import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../dio/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  // ignore: prefer_final_fields
  static NoParams _noParams = const NoParams._();

  const NoParams._();

  static NoParams get instance => _noParams;

  @override
  List<Object?> get props => [];
}
