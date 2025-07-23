import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio();
  // ToDo: Set the Url for your API

  dio.options.baseUrl = 'https://fast-recharge.online/public/api';
  dio.options.headers['accept'] = 'application/json';
  return dio;
}
