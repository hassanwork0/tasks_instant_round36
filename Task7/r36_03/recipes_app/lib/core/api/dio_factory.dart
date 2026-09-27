import 'package:dio/dio.dart';
import 'package:recipes_app/core/const/app_constants.dart';

class DioFactory {
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );

      // بنضيف Interceptor عشان تشوف الـ Requests والـ Errors في الـ Console وأنت بتعمل Debug
      _dio!.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
    return _dio!;
  }
}
