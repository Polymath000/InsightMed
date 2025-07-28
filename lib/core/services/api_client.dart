import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

import '../constants/end_ponits.dart';
import 'shared_preferences_singleton.dart';

sealed class ApiClient {
  FlutterSecureStorage get storage;
  Future<Map<String, dynamic>> post({
    required final String path,
    final Map<String, dynamic>? data,
  });

  Future<Map<String, dynamic>> get({
    required final String path,
    final Map<String, dynamic>? queryParameters,
  });

  Future<Response> put({
    required final String path,
    required final Map<String, dynamic> data,
  });

  Future<Response> delete({required final String path});
}

final class DioClient extends ApiClient {
  factory DioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${SharedPreferencesSingleton.getString('access_token')}',
        },
      ),
    );
    return DioClient._internal(dio);
  }

  DioClient._internal(this._dio) {
    final logger = Logger(printer: PrettyPrinter(methodCount: 0));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (final options, final handler) {
          options.headers['Authorization'] =
              'Bearer ${SharedPreferencesSingleton.getString('access_token')}';
          final requestPath = '${options.baseUrl}${options.path}';
          logger.i('${options.method} request ==> $requestPath');
          return handler.next(options);
        },
        onError: (final error, final handler) {
          final options = error.requestOptions;
          final requestPath = '${options.baseUrl}${options.path}';
          logger
            ..e('${options.method} request ==> $requestPath')
            ..d(
              'Error type: ${error.error} \n '
              'Error message: ${error.message}',
            );
          handler.next(error);
        },
        onResponse: (final response, final handler) {
          logger.d(
            'STATUSCODE: ${response.statusCode} \n '
            'STATUSMESSAGE: ${response.statusMessage} \n'
            'HEADERS: ${response.headers} \n'
            'Data: ${response.data}',
          );
          handler.next(response);
        },
      ),
    );
  }

  @override
  FlutterSecureStorage get storage => const FlutterSecureStorage();
  final Dio _dio;

  @override
  Future<Map<String, dynamic>> post({
    required final String path,
    final Map<String, dynamic>? data,
  }) => _dio
      .post<Map<String, dynamic>>(path, data: data)
      .then((final response) => response.data!);

  @override
  Future<Map<String, dynamic>> get({
    required final String path,
    final Map<String, dynamic>? queryParameters,
  }) => _dio
      .get<Map<String, dynamic>>(path, queryParameters: queryParameters)
      .then((final response) => response.data!);

  @override
  Future<Response> put({
    required final String path,
    required final Map<String, dynamic> data,
  }) => _dio.put(path, data: data);

  @override
  Future<Response> delete({required final String path}) => _dio.delete(path);
}
