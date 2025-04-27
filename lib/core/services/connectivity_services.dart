import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityServiceCubit extends Cubit<bool>  {
  ConnectivityServiceCubit() : super(true);

  final InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  Future<bool> checkConnectivity() async {
    var value = await connectionChecker.hasConnection;
    emit(value);
    return value;
  }

}
