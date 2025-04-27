// import 'dart:io';
//
// import 'package:bookz_app/core/constants/app_constants.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
//
// class ApiService {
//   final Dio _dio;
//
//   ApiService(this._dio) {
//     (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = ((HttpClient client) {
//       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//       return client;
//     });
//   }
//
//   Future<Map<String, dynamic>> get({required String endPoint, Map<String, dynamic>? queryParameters}) async {
//     var response = await _dio.get('${AppConstants.baseUrl}$endPoint', queryParameters: queryParameters);
//     return response.data;
//   }
// }