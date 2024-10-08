import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../base_model.dart';
import 'dio_exception_handler.dart';
import 'exception_enum.dart';

class ErrorModel implements BaseModel {
  String? message;
  ExceptionEnum? exceptionEnum;

  ErrorModel({
    this.message,
    this.exceptionEnum,
  });

  factory ErrorModel.fromJson(dynamic exception) {
    // logError(exception);

    ExceptionEnum exceptionEnum = ExceptionEnum.unknownException;
    String? errorMessage;
    switch (exception.runtimeType) {
      case DioException:
        exceptionEnum = DioExceptionHandler().handleException(exception);
        errorMessage = DioExceptionHandler().getErrorMessage(exception);
        break;
      case SocketException:
        exceptionEnum = ExceptionEnum.connectionErrorException;
        break;
      case FormatException:
        exceptionEnum = ExceptionEnum.formatException;
        break;
      case TimeoutException:
        exceptionEnum = ExceptionEnum.connectionTimeOutException;
        break;
      case HttpException:
        exceptionEnum = ExceptionEnum.connectionErrorException;
        break;
      default:
        if (exception is String) {
          if (exception.startsWith('<!DOCTYPE html>')) {
            exceptionEnum = ExceptionEnum.docTypeHtmlException;
          } else {
            exceptionEnum = ExceptionEnum.generalException;
          }
        }
        break;
    }
    return ErrorModel(
      // message: ErrorHandler.exception(exceptionEnum, exception).toString(),
      message: errorMessage,
      exceptionEnum: exceptionEnum,
    );
  }

  @override
  String toString() {
    return 'ErrorModel(message: : $message, exceptionEnum: ${exceptionEnum?.name} )';
  }
}
