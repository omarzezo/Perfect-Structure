import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:perfection_structure/core/log/app_log.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      AppLog.logValue('Error writing to secure storage: $e');
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      AppLog.logValue('Error reading from secure storage: $e');
      return null;
    }
  }

  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      AppLog.logValue('Error deleting from secure storage: $e');
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      AppLog.logValue('Error clearing secure storage: $e');
    }
  }
}
