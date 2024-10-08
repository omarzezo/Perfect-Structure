import 'package:perfection_structure/core/local_storage/secure_storage/secure_storage_service/secure_storage_service.dart';

class ClearSecureDataUseCase {
  final SecureStorageService _service;

  ClearSecureDataUseCase(this._service);

  Future<void> execute() {
    return _service.clear();
  }
}