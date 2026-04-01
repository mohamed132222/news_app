import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';

// class DioInterceptor1 implements InterceptorsWrapper{
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // TODO: implement onError
//     super.onError(err, handler);
//   }
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // TODO: implement onRequest
//     super.onRequest(options, handler);
//   }
//   @override
//   void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);
//   }
// }
class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    print("onRequest: ${options.baseUrl}");
    options.headers.addAll({"X-Api-Key": ApiConstant.apiKey});
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // TODO: implement onResponse
    print("onResponse status code: ${response.statusCode}");
    handler.next(response);
  }
}
