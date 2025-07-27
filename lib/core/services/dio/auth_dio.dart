import 'package:dio/dio.dart';

import '../../network/interceptors.dart';

Dio dio() {
  var dio = Dio()..interceptors.addAll([LoggerInterceptor()]);
  dio.options.baseUrl = 'https://fast-recharge.online/api';
  dio.options.headers['accept'] = 'application/json';
  return dio;
}
