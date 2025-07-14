import 'package:dio/dio.dart';

Dio dio() {
  Dio dio =  Dio();
          // ToDo: Set the Url for your API

  dio.options.baseUrl = "";
  // dio.options.headers['accept'] = 'Application/Json';
  return dio;
}
