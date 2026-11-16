import 'package:dio/dio.dart';
import 'package:job_ui/core/api/endpoints.dart';


class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: const {'Accept': 'application/json'},
        responseType: ResponseType.json,
      ),
    );

    return _dio!;
  }
}
