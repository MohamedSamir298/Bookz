import 'package:dio/dio.dart';

import '../status_code.dart';
import 'exceptions.dart';

dynamic handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw const FetchDataException();
    case DioExceptionType.cancel:
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.accountLockedFromAdmin:
          throw const AccountLockedFromAdminException();
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          throw const UnauthorizedException();
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.confilct:
          throw const ConflictException();

        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
      break;
    case DioExceptionType.unknown:
      throw NoInternetConnectionException();
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      break;
    case DioExceptionType.connectionError:
      // TODO: Handle this case.
      break;
    case DioExceptionType.badResponse:
      // TODO: Handle this case.
      break;
  }
}
