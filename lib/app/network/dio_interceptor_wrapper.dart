import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioCustomInterceptors extends Interceptor {
  final Dio dio;

  DioCustomInterceptors({
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.addAll(
      {
        'appid': '5f6d9197fce11e07c6bf3718f72d0b4a',
      },
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    debugPrint('response: ${response.data}');
    super.onResponse(response, handler);
  }
}
