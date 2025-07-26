abstract class ApiConsumer {
  Future<dynamic> get(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  });
  Future<dynamic> patch(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  });
  Future<dynamic> delete(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final bool isFromData = false,
  });
}
