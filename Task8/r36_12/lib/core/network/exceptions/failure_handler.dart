import 'package:dio/dio.dart';
import 'failure.dart';

class FailureHandler {
  FailureHandler._();

  static Failure handle(Object error) {
    if (error is! DioException) {
      return const UnknownFailure('An unexpected error occurred');
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const TimeoutFailure(),
      DioExceptionType.connectionError => const NetworkFailure(),
      DioExceptionType.cancel => const CancelledFailure(),
      DioExceptionType.badCertificate => const UnknownFailure(
        'Invalid security certificate',
      ),
      DioExceptionType.badResponse => _fromStatusCode(error.response),
      DioExceptionType.unknown => const NetworkFailure(),
      DioExceptionType.transformTimeout => throw NetworkFailure(),
    };
  }

  static Failure _fromStatusCode(Response? response) {
    final serverMessage = (response?.data is Map)
        ? response?.data['message'] as String?
        : null;

    return switch (response?.statusCode) {
      400 || 422 => BadRequestFailure(serverMessage ?? 'Incorrect data'),
      401 => const UnauthorizedFailure(),
      403 => const BadRequestFailure(
        'You have no authority to carry out this operation.',
      ),
      404 => NotFoundFailure(serverMessage ?? 'The item is not available'),
      500 => const ServerFailure(),
      _ => UnknownFailure(serverMessage ?? 'An unexpected error occurred'),
    };
  }
}
