import 'package:dio/dio.dart';
import 'package:recipes_app/core/api/end_points.dart';

class DioFactory {
  static Dio? _dio;

  DioFactory._();

  static Dio getDio() {
    if (_dio != null) return _dio!;

    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        sendTimeout: Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    return _dio!;
  }
}
