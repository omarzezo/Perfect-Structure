import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:perfection_structure/core/base_network/api_endpoints_constants.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';
import 'package:perfection_structure/core/network_layer/new_network/error_handler.dart';
import 'package:perfection_structure/core/network_layer/new_network/network_service.dart';
import 'package:perfection_structure/core/network_layer/new_network/request_interceptor.dart';
import 'package:perfection_structure/core/network_layer/new_network/token_interceptor.dart';

const _defaultConnectTimeout = const Duration(seconds: 5);
const _defaultReceiveTimeout = const Duration(seconds: 5);

class DioClient implements NetworkService{
  final String baseUrl = ApiEndpointsConstants.baseUrl;

  late Dio _dio;

  final List<Interceptor> interceptors = [];

  DioClient() {
    _dio =  Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
      _dio.interceptors.add(RequestInterceptor());
      _dio.interceptors.add(TokenInterceptor(_dio));
      _dio.interceptors.addAll(interceptors);
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
  }

  @override
  Future<ApiResult<dynamic>> get(String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      ApiResult mmm= ApiResult().setData(response);

      print('dataaaa>>'+mmm.data.toString());
      return ApiResult();
      // return response.data;
    }catch(e){
      if (e is DioException) {
        return ApiResult()..setException(ErrorHandler.dioException(error: e),);
      }
      return ApiResult()..setException(ErrorHandler.otherException(),);
    }
    // } on DioError catch (e) {
    //    throw handleDioError(e);
    // }  catch (e) {
    //   throw NetworkException('Unexpected error: $e');
    // }
  }

  @override
  Future<ApiResult<dynamic>> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResult()..setData(response);
      return response.data;
    }catch(e){
      if (e is DioException) {
        return ApiResult()..setException(ErrorHandler.dioException(error: e),);
      }
      return ApiResult()..setException(ErrorHandler.otherException(),);
    }
    // } on DioError catch (e) {
    //   throw handleDioError(e);
    // }  catch (e) {
    //   throw NetworkException('Unexpected error: $e');
    // }
  }

  @override
  Future<ApiResult<dynamic>> patch(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResult()..setData(response);
      return response.data;
    }catch(e){
      if (e is DioException) {
        return ApiResult()..setException(ErrorHandler.dioException(error: e),);
      }
      return ApiResult()..setException(ErrorHandler.otherException(),);
    }
    // } on DioError catch (e) {
    //   throw handleDioError(e);
    // }  catch (e) {
    //   throw NetworkException('Unexpected error: $e');
    // }
  }

  @override
  Future<ApiResult<dynamic>> delete(
      String uri, {
        data, Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var response = await _dio.delete(
        uri, data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResult()..setData(response);
      return response.data;
    }catch(e){
      if (e is DioException) {
        return ApiResult()..setException(ErrorHandler.dioException(error: e),);
      }
      return ApiResult()..setException(ErrorHandler.otherException(),);
    }
    // }on DioError catch (e) {
    //   throw handleDioError(e);
    // }  catch (e) {
    //   throw NetworkException('Unexpected error: $e');
    // }
  }
}

