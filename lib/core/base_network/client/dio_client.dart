import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:perfection_structure/core/base_network/api_endpoints_constants.dart';
import 'package:perfection_structure/core/error/handler/error_model.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';
import 'package:perfection_structure/core/network_layer/new_network/error_handler.dart';
import 'package:perfection_structure/core/network_layer/new_network/request_interceptor.dart';
import 'package:perfection_structure/core/network_layer/new_network/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../base_model.dart';

const _defaultConnectTimeout = Duration(seconds: 5);
const _defaultReceiveTimeout = Duration(seconds: 5);

class DioClient {
  String baseUrl() => ApiEndpointsConstants.baseUrl;
  // late final dio = Dio();
  late Dio dio ;
  final List<Interceptor> interceptors = [];
  DioClient() {
    dio =  Dio();
    dio
      ..options.baseUrl = baseUrl()
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${'apiToken'}',
      };
    dio.interceptors.add(PrettyDioLogger(
      compact: false,
      logPrint: (object) => log(object.toString(), name: 'Test'),
    ));
    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(TokenInterceptor(dio));
    dio.interceptors.addAll(interceptors);
  }

  Future<dynamic> get <T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters = const {},
    required BaseModel model,
  }) async {
    try {
      final response = await dio.get(
        "${baseUrl()}$path",
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.created:
          {
            return _jsonBodyParser<T>(model, response.data);
          }
        default: throw response.data;
      }
    }catch(e){
      ErrorModel.fromJson(e);
      if (e is DioException) {
        ApiResult().setException(ErrorHandler.dioException(error: e),);
      }
      ApiResult().setException(ErrorHandler.otherException(),);
      // if (e is DioException) {
      //    return Left(ApiResult().setException(ErrorHandler.dioException(error: e),)); // Return error
      // }
      //  return Left(ApiResult().setException(ErrorHandler.otherException(),));
    }
  }

  Future<dynamic> post<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.post("${baseUrl()}$path",
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body);
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "401";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  Future<dynamic> put<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.put(
      "${baseUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "403";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  Future<dynamic> delete<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.delete(
      "${baseUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "401";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  dynamic _jsonBodyParser<T>(model, body) {
    if (body is List) {
      final res = body.map((e) => model.fromJson(e)).toList().cast<T>();
      return res;
    } else if (body is! List) {
      return model.fromJson(body);
    } else {
      return body;
    }
  }
}
