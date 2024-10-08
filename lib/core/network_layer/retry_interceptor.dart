import 'package:dio/dio.dart';

// class RetryInterceptor extends Interceptor {
//   final Dio dio;
//   int maxRetries;
//   int retryCount = 0;
//
//   RetryInterceptor({required this.dio, this.maxRetries = 3});
//
//   // @override
//   // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//   //   print('testtttm>>'+handler.isCompleted.toString());
//   //   super.onRequest(options, handler);
//   // }
//
//   @override
//   Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (_shouldRetry(err)) {
//       try {
//         // Retry the request
//          retryCount = err.requestOptions.extra["retryCount"] ?? 0;
//         print('retryCount>>'+retryCount.toString());
//         print('maxRetries>>'+maxRetries.toString());
//         if (retryCount < maxRetries) {
//           // Increase retry count
//           retryCount++;
//           err.requestOptions.extra["retryCount"] = retryCount + 1;
//
//           print('retryCount>>'+retryCount.toString());
//           // Wait for a few seconds before retrying
//           await Future.delayed(const Duration(seconds: 2));
//           // Retry the request
//           print('testttt>>'+err.requestOptions.path.toString());
//           final response = await dio.request(
//             err.requestOptions.path,
//             options: Options(
//               method: err.requestOptions.method,
//               headers: err.requestOptions.headers,
//             ),
//             data: err.requestOptions.data,
//             queryParameters: err.requestOptions.queryParameters,
//           );
//
//           // Return the successful response
//           return handler.resolve(response);
//         }
//       } catch (e) {
//         // Retry failed, forward the error
//         return handler.next(err);
//       }
//     }
//     return handler.next(err); // Forward the error if no retry
//   }
//
//   bool _shouldRetry(DioError err) {
//     // Retry if there is a network-related error
//     return err.type == DioErrorType.connectionError ||
//         err.type == DioErrorType.receiveTimeout ||
//         err.type == DioErrorType.sendTimeout;
//   }
// }


class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
  });

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // Check if this is a connection error or a specific condition
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] == null) {
      // Initialize retry count if not already present
      err.requestOptions.extra['retryCount'] = 0;
    }

    // Get the current retry count from the requestOptions
    int retryCount = err.requestOptions.extra['retryCount'] ?? 0;

    if (retryCount < maxRetries) {
      // Increment retry count for this request
      err.requestOptions.extra['retryCount'] = retryCount + 1;

      // Optional: Add a delay between retries
        await Future.delayed(Duration(milliseconds: 1000));

      try {
        // Retry the request
        final response = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        // Return the successful response
        return handler.resolve(response);
      } catch (e) {
        // Retry failed, forward the error
        return handler.next(err);
      }
    } else {
      // If maxRetries have been reached, forward the error
      return handler.next(err);
    }
  }

  // Custom method to determine if the error is retryable
  bool _shouldRetry(DioError err) {
    // Retry for connection errors, timeout, etc.
    return err.type == DioErrorType.connectionError ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout;
  }
}
