abstract class ErrorsEntity {
  final String? errorCode;
  final String? message;

  const ErrorsEntity({this.errorCode, this.message});

  @override
  String toString() => 'ErrorsEntity(errorCode: $errorCode, message: $message)';
}
