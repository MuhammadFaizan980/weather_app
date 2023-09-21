import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../utils/network/network_info.dart';
import '../errors/failures.dart';
import 'dio_error_handler.dart';

abstract class IDioWrapper {
  Future<Response<dynamic>> onPost({required String api, required dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  Future<Response<dynamic>> onDelete({required String api, dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  Future<Response<dynamic>> onGet({required String api, Map<String, dynamic>? queryParameters, dynamic data, Map<String, dynamic>? headers});

  Future<Response<dynamic>> onPut({required String api, dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  void resolveAPIMetadata({Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
}

class DioWrapperImpl extends IDioWrapper {
  final Dio _dio;
  final DioErrorHandler _dioErrorHandler;
  final INetworkInfo _networkInfo;
  final Logger _logger;

  DioWrapperImpl({
    required Dio dio,
    required DioErrorHandler dioErrorHandler,
    required Logger logger,
    required INetworkInfo networkInfo,
  })  : _dio = dio,
        _dioErrorHandler = dioErrorHandler,
        _networkInfo = networkInfo,
        _logger = logger;

  @override
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    if (!await _networkInfo.isConnected) {
      throw const NetworkFailure(
        title: 'No Internet',
        message: 'You are not connected to internet',
      );
    }

    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers);
      return await _dio.post(api, data: data);
    } on DioException catch (e) {
      _logger.wtf('[ON POST | DIO ERROR | API $api] ${e.response}');
      if (e.type == DioExceptionType.badResponse) {
        throw _dioErrorHandler.resolveErrors(response: e.response!);
      }
      throw _dioErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      throw _dioErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onDelete({
    required String api,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    if (!await _networkInfo.isConnected) {
      throw const NetworkFailure(
        title: 'No Internet',
        message: 'You are not connected to internet',
      );
    }
    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers);
      return await _dio.delete(api, data: data);
    } on DioException catch (e) {
      _logger.wtf('[ON POST | DIO ERROR | API $api] ${e.response}');
      if (e.type == DioExceptionType.badResponse) {
        throw _dioErrorHandler.resolveErrors(response: e.response!);
      }
      throw _dioErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      throw _dioErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    if (!await _networkInfo.isConnected) {
      throw const NetworkFailure(
        title: 'No Internet',
        message: 'You are not connected to internet',
      );
    }

    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers);
      return await _dio.get(api, data: data);
    } on DioException catch (e) {
      _logger.wtf('[ON GET | DIO ERROR | API $api] $e');
      if (e.type == DioExceptionType.badResponse) {
        throw _dioErrorHandler.resolveErrors(response: e.response!);
      }
      throw _dioErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON GET | SOMETHING GOES WRONG IN API CALL] $e');
      throw _dioErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onPut({
    required String api,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    if (!await _networkInfo.isConnected) {
      throw const NetworkFailure(
        title: 'No Internet',
        message: 'You are not connected to internet',
      );
    }

    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers);
      return await _dio.put(api, data: data);
    } on DioException catch (e) {
      _logger.wtf('[ON GET | DIO ERROR | API $api] $e');
      if (e.type == DioExceptionType.badResponse) {
        throw _dioErrorHandler.resolveErrors(response: e.response!);
      }
      throw _dioErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON GET | SOMETHING GOES WRONG IN API CALL] $e');
      throw _dioErrorHandler.throwDefaultFailure();
    }
  }

  @override
  void resolveAPIMetadata({Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    _dio.options.queryParameters.clear();
    if (queryParameters != null) {
      _dio.options.queryParameters.addAll(queryParameters);
    }

    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
  }
}
