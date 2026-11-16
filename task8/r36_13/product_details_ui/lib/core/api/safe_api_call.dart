

// import 'package:product_details_ui/core/api/api_result.dart';
// import 'package:product_details_ui/core/api/expections/faliure_handler.dart';

// Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() call) async {
//   try {
//     final data = await call();
//     return ApiSuccess(data);
//   } catch (error) {
//     return ApiFailure(ApiFaliureHandler.handle(error));
//   }
// }