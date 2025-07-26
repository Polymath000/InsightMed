import 'package:dio/dio.dart'
    show Interceptor, RequestInterceptorHandler, RequestOptions;

import '../constants/end_ponits.dart' show ApiKey;

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
        ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}

class CacheHelper {
  getData({required final String key}) {}
}
