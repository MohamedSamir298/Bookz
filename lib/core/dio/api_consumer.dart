import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters,Options? options,dynamic body});
  Future<Response> post(String path, {Map<String, dynamic>? queryParameters, dynamic body,Options? options,bool formDataEnabled});
  Future<Response> put(String path, {Map<String, dynamic>? queryParameters, dynamic body,Options? options,bool formDataEnabled});
  Future<Response> delete(String path,{Map<String, dynamic>? queryParameters, Map<String, dynamic>? body,Options? options});

}