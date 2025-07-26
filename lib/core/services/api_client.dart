import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/end_ponits.dart';

sealed class ApiClient {
  FlutterSecureStorage get storage;
  Future<Map<String, dynamic>> post({
    required final String path,
    final Map<String, dynamic>? data,
  });

  Future<Map<String, dynamic>> get(
    final String path, {
    final Map<String, dynamic>? queryParameters,
  });

  Future<Response> put(final String path, final Map<String, dynamic> data);

  Future<Response> delete(final String path);
}

final class DioClient extends ApiClient {
  factory DioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return DioClient._internal(dio);
  }

  DioClient._internal(this._dio) {
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
  Future<Map<String, dynamic>> get(
    final String path, {
    final Map<String, dynamic>? queryParameters,
  }) => _dio
      .get<Map<String, dynamic>>(path, queryParameters: queryParameters)
      .then((final response) => response.data!);

  @override
  Future<Response> put(final String path, final Map<String, dynamic> data) =>
      _dio.put(path, data: data);

  @override
  Future<Response> delete(final String path) => _dio.delete(path);
}
