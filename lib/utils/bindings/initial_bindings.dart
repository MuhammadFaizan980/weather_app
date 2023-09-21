import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_alice/alice.dart';
import 'package:get/get.dart';
import 'package:it_zone_task/app/network/dio_error_handler.dart';
import 'package:it_zone_task/app/network/dio_interceptor_wrapper.dart';
import 'package:it_zone_task/app/network/dio_wrapper.dart';
import 'package:logger/logger.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../network/network_info.dart';
import '../network/network_info_imp.dart';
import '../routes/navigator.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<Alice>(Alice(showNotification: true, navigatorKey: Get.key), permanent: true);
    Get.put<INavigator>(NavigatorImpl(), permanent: true);
    Get.put<Connectivity>(Connectivity(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfo(), permanent: true);

    Get.put<INetworkInfo>(
      NetworkInfoImpl(connectivity: Get.find<Connectivity>()),
      permanent: true,
    );

    Get.put<Dio>(
      Dio(
        BaseOptions(
          receiveTimeout: const Duration(milliseconds: 30000),
          connectTimeout: const Duration(milliseconds: 30000),
          sendTimeout: const Duration(milliseconds: 30000),
          baseUrl: 'https://api.openweathermap.org/',
        ),
      ),
      permanent: true,
    );

    Get.put<Logger>(Logger(filter: ShowAllLogsFilter()), permanent: true);
    Get.put<DioErrorHandler>(DioErrorHandlerImpl(), permanent: true);
    Get.put<IDioWrapper>(
      DioWrapperImpl(
        dio: Get.find(),
        dioErrorHandler: Get.find(),
        logger: Get.find(),
        networkInfo: Get.find(),
      ),
      permanent: true,
    );

    _addDioLogger();
  }

  void _addDioLogger() {
    Dio dio = Get.find<Dio>();
    Alice alice = Alice(navigatorKey: Get.key);
    dio.interceptors.add(alice.getDioInterceptor());

    dio.interceptors.addAll([
      DioCustomInterceptors(dio: Get.find<Dio>()),
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (value) {
          log('LogInterceptor => $value');
        },
      ),
    ]);
  }
}

class ShowAllLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
