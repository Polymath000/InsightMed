import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio();
  dio.options.baseUrl = 'https://fast-recharge.online/public/api';
  dio.options.headers['accept'] = 'application/json';
  return dio;
}
