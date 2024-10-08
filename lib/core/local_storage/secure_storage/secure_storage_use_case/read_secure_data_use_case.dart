
import '../secure_storage_service/secure_storage_service.dart';

class ReadSecureDataUseCase {
  final SecureStorageService _service;

  ReadSecureDataUseCase(this._service);

  Future<String?> execute(String key) {
    return _service.read(key);
  }
}