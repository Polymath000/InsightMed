import 'package:dio/dio.dart';

import '../services/shared_preferences_singleton.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    final token = SharedPreferencesSingleton.getString('access_token');
    if (token!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
