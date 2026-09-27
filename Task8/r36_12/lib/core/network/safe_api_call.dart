import 'package:flutter/foundation.dart';
import 'api_result.dart';
import 'exceptions/failure_handler.dart';

Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final data = await call();
    return ApiSuccess(data);
  }

  catch (error) {
    debugPrint('[SafeApiCall Error]: $error');
    return ApiFailure(FailureHandler.handle(error));
  }
}
