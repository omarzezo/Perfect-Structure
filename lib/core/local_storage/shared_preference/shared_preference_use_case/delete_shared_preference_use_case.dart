import '../shared_preference_service/shared_preference_service.dart';

class DeleteSharedPreferencesUseCase {
  final SharedPreferencesService _service;

  DeleteSharedPreferencesUseCase(this._service);

  Future<void> execute(String key) {
    return _service.remove(key);
  }
}