import 'package:dio/dio.dart';
import 'package:perfection_structure/core/network_layer/new_network/error_handler.dart';

/// Adding all API success/error response in to this generic class
class ApiResult<T> {
  ErrorHandler? _exception;
  T? _data;

  setException(ErrorHandler error) {
    // if (error is DioException){
    //   ErrorHandler.dioException(error: error as DioException);
    // }else{
    //   ErrorHandler.otherException();
    // }
    _exception = error;
  }
  setData(T data){
    _data = data;
  }

  get data{
    return _data;
  }

  get getException {
    return _exception;
  }
}


