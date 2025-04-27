// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message;
  String? stacktrace;

  Failure(this.message, [this.stacktrace]);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure(String message, [String? stacktrace])
      : super(message, stacktrace);
}

class FailuresList extends Failure {
  final List<String> errors;
  @override
  String message;
  @override
  String? stacktrace;
  FailuresList(this.message, this.stacktrace, {required this.errors})
      : super(message, stacktrace);
}

class CacheFailure extends Failure {
  CacheFailure(String message, String? stacktrace) : super(message, stacktrace);
}
