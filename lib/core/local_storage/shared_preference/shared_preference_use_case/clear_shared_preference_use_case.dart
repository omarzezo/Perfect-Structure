import '../shared_preference_service/shared_preference_service.dart';

class ClearSharedPreferencesUseCase {
  final SharedPreferencesService _service;

  ClearSharedPreferencesUseCase(this._service);

  Future<void> execute() {
    return _service.clear();
  }
}