import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/end_ponits.dart';

class ApiClient {
  factory ApiClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );
    return ApiClient._internal(dio);
  }

  ApiClient._internal(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (final options, final handler) async {
          final token = await storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  static const storage = FlutterSecureStorage();
  final Dio _dio;

  Future<Map<String, dynamic>> post({
    required final String path,
    final Map<String, dynamic>? data,
  }) => _dio
      .post<Map<String, dynamic>>(path, data: data)
      .then((final response) => response.data!);

  Future<Map<String, dynamic>> get(
    final String path, {
    final Map<String, dynamic>? queryParameters,
  }) => _dio
      .get<Map<String, dynamic>>(path, queryParameters: queryParameters)
      .then((final response) => response.data!);

  Future<Response> put(final String path, final Map<String, dynamic> data) =>
      _dio.put(path, data: data);

  Future<Response> delete(final String path) => _dio.delete(path);
}
