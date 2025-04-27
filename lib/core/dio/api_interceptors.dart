import 'dart:developer';
import 'package:dio/dio.dart';
import '../services/connectivity_services.dart';
import '../services/services_locator.dart';
import '../ui_helpers/custom_shared_widgets/custom_print.dart';
import 'error/api_errors.dart';
import 'error/exceptions.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var internetService = sl<ConnectivityServiceCubit>();

    bool isConnected = await internetService.checkConnectivity();
    ("_handleSendRequest - isConnected: $isConnected");
    if (isConnected == false) {
      handler.reject(DioException(requestOptions: options, error: NoInternetConnectionException()));
      return;
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // iPrint("response: ${response.data}");
    //  debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    log(response.data.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ePrint("error: ${err.error.toString()}");
    ePrint("error message: ${err.message.toString()}");
    ePrint("error response ${err.response.toString()}");
    handleDioError(err);
    handler.next(err);
    super.onError(err, handler);
  }
}
