
import '../secure_storage_service/secure_storage_service.dart';

class DeleteSecureDataUseCase {
  final SecureStorageService _service;

  DeleteSecureDataUseCase(this._service);

  Future<void> execute(String key) {
    return _service.delete(key);
  }
}