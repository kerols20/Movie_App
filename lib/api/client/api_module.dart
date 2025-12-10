import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/constant_app/end_point.dart';

@module
abstract class ApiModule {
  @singleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(baseUrl: EndPoint.baseUrl ,receiveDataWhenStatusError: true),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    return dio;
  }
}
