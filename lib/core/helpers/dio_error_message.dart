import 'package:dio/dio.dart' as dio_package;

import 'get_auth_message.dart';

String mapDioErrorToMessage(final dio_package.DioException e) {
  final messages = getAuthMessages;
  switch (e.type) {
    case dio_package.DioExceptionType.connectionTimeout:
    case dio_package.DioExceptionType.sendTimeout:
    case dio_package.DioExceptionType.receiveTimeout:
      return 'Oops! The connection took too long. Please check your internet and try again.';
    case dio_package.DioExceptionType.badResponse:
      return 'Sorry, we had trouble processing your request. Please try again in a moment.';
    case dio_package.DioExceptionType.cancel:
      return 'No worries, your request was cancelled.';
    case dio_package.DioExceptionType.unknown:
      return 'Something went wrong with the network. Please check your connection and try again.';
    default:
      return 'Unexpected error occurred. Please try again or contact support if the problem continues.';
  }
}
