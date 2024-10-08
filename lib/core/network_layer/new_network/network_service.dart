import 'package:dio/dio.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';

abstract class NetworkService {
  Future<ApiResult<dynamic>>  get(String uri, {Map<String, dynamic>? queryParameters,
    Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress,});

  Future<ApiResult<dynamic>>  post(String uri, {
    data, Map<String, dynamic>? queryParameters,
    Options? options, CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<ApiResult<dynamic>>  patch(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<ApiResult<dynamic>>  delete(String uri, {
    data, Map<String, dynamic>? queryParameters,
    Options? options, CancelToken? cancelToken,
  });
}