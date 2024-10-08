import 'dart:io';
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'An unknown network error occurred']);

  @override
  String toString() => message;
}

class BadRequestException extends NetworkException {
  BadRequestException([String message = 'Invalid request']) : super(message);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException([String message = 'Unauthorized request']) : super(message);
}

class ForbiddenException extends NetworkException {
  ForbiddenException([String message = 'Forbidden request']) : super(message);
}

class NotFoundException extends NetworkException {
  NotFoundException([String message = 'Resource not found']) : super(message);
}

class ServerErrorException extends NetworkException {
  ServerErrorException([String message = 'Server error']) : super(message);
}

class TimeoutException extends NetworkException {
  TimeoutException([String message = 'Connection timed out']) : super(message);
}

class NoInternetException extends NetworkException {
  NoInternetException([String message = 'No internet connection']) : super(message);
}

class RequestCancelledException extends NetworkException {
  RequestCancelledException([String message = 'Request cancelled']) : super(message);
}



Exception handleDioError(DioError error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutException();
    case DioExceptionType.badResponse:
      if (error.response?.statusCode == 400) {
        return BadRequestException();
      } else if (error.response?.statusCode == 401) {
        return UnauthorizedException();
      } else if (error.response?.statusCode == 403) {
        return ForbiddenException();
      } else if (error.response?.statusCode == 404) {
        return NotFoundException();
      } else if (error.response?.statusCode! == 500) {
        return ServerErrorException();
      }
      return NetworkException('Received invalid status code: ${error.response?.statusCode}');
    case DioExceptionType.cancel:
      return RequestCancelledException();
    case DioExceptionType.unknown:
      if (error.message?.contains('SocketException')??false) {
        return NoInternetException();
      }
      return NetworkException(error.message??'');
    default:
      return NetworkException();
  }
}

dynamic handleResponse(Response<dynamic>  response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 201:
      return response;
    case 400:
      throw BadRequestException();
    case 401:
      throw UnauthorizedException();
    case 403:
      throw ForbiddenException();
    case 404:
      throw NotFoundException();
    case 500:
      throw ServerErrorException();
    default:
      throw NetworkException('Error occurred while communicating with the server. Status code: ${response.statusCode}');
  }
}
