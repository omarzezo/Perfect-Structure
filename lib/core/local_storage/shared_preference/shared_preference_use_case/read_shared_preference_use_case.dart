import '../shared_preference_service/shared_preference_service.dart';

class ReadSharedPreferencesUseCase {
  final SharedPreferencesService _service;

  ReadSharedPreferencesUseCase(this._service);

  Future<String?> execute(String key) {
    return _service.read(key);
  }
}
