import 'package:dio/dio.dart';

String mapDioErrorToMessage(final DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Oops! The connection took too long. '
          'Please check your internet and try again.';
    case DioExceptionType.badResponse:
      return 'Sorry, we had trouble processing your request. '
          'Please try again in a moment.';
    case DioExceptionType.cancel:
      return 'No worries, your request was cancelled.';
    case DioExceptionType.unknown:
      return 'Something went wrong with the network. '
          'Please check your connection and try again.';
    case DioExceptionType.connectionError:
      return 'Oops! Something went wrong with the network. '
          'Please check your connection and try again.';
    case DioExceptionType.badCertificate:
      return 'Oops! Something went wrong with the network. '
          'Please check your connection and try again.';
  }
}
