import 'dart:io';

import 'package:bookz_app/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../services/services_locator.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  Dio client = sl<Dio>();

  DioConsumer() {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = ((HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    });

    client.options.responseType = ResponseType.json;
    client.options.baseUrl = AppConstants.baseUrl;
    client.options.validateStatus = (status) {
      return status! < 500;
    };

    // ..sendTimeout = 500;
    client.interceptors.add(ApiInterceptors());

    if (kDebugMode) {
      client.interceptors.add(LogInterceptor(
        requestHeader: true,
        request: true,
        requestBody: true,
        error: true,
        responseHeader: true,
      ));
    }
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Options? options, dynamic body}) {
    return client.get(path, queryParameters: queryParameters, options: options, data: body);
  }

  @override
  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options, bool formDataEnabled = false}) {
    return client.post(
      path,
      queryParameters: queryParameters,
      options: options,
      data: formDataEnabled ? FormData.fromMap(body!) : body,
    );
  }

  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? queryParameters, dynamic body, Options? options, bool formDataEnabled = false}) {
    return client.put(path,
        queryParameters: queryParameters, data: formDataEnabled ? FormData.fromMap(body!) : body, options: options);
  }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, Options? options}) {
    return client.delete(path, queryParameters: queryParameters, data: body, options: options);
  }
}
