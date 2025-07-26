import 'package:dio/dio.dart';

import '../constants/end_ponits.dart' show EndPoint;
import 'api_consumer.dart' show ApiConsumer;
import 'api_interceptors.dart' show ApiInterceptor;

class DioConsumer extends ApiConsumer {
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
  final Dio dio;

  @override
  Future delete(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    final String path, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    final String path, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  void handleDioExceptions(final DioException e) {}
}
