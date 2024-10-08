
import 'errors_entity.dart';

class ErrorsModel extends ErrorsEntity {
  const ErrorsModel({super.errorCode, super.message});

  factory ErrorsModel.fromJson(Map<String, dynamic> json) => ErrorsModel(
        errorCode: json['errorCode'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'errorCode': errorCode,
        'message': message,
      };
}
