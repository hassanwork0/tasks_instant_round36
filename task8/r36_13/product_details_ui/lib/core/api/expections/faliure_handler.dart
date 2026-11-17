import 'package:dio/dio.dart';
import 'package:product_details_ui/core/api/expections/faliure.dart';


class ApiFaliureHandler {
  ApiFaliureHandler._();

  static Failure handle(Object error) {
    if (error is! DioException) {
      return const UnknownFailure('حصل خطأ غير متوقع');
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const TimeoutFailure(),

      DioExceptionType.connectionError => const NetworkFailure(),
      DioExceptionType.cancel => const CancelledFailure(),
      DioExceptionType.badCertificate => const UnknownFailure('شهادة أمان غير صالحة'),
      DioExceptionType.badResponse => _fromStatusCode(error.response),
      DioExceptionType.unknown => const NetworkFailure(),
      DioExceptionType.transformTimeout => const NetworkFailure(),
    };
  }

  static Failure _fromStatusCode(Response? response) {
    // DummyJSON بيرجّع {"message": "..."} في كل الأخطاء
    final serverMessage = (response?.data is Map)
        ? response?.data['message'] as String?
        : null;

    return switch (response?.statusCode) {
      400 || 422 => BadRequestFailure(serverMessage ?? 'بيانات غير صحيحة'),
      401 => const UnauthorizedFailure(),
      403 => const BadRequestFailure('مالكش صلاحية للعملية دي'),
      404 => NotFoundFailure(serverMessage ?? 'العنصر مش موجود'),
      500 => const ServerFailure(),
      _ => UnknownFailure(serverMessage ?? 'حصل خطأ غير متوقع'),
    };
  }
}