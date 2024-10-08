// import 'package:flutter/material.dart';
// import 'package:perfection_structure/core/local_storage/secure_storage/secure_storage_use_case/clear_secure_data_use_case.dart';
// import 'package:perfection_structure/core/local_storage/secure_storage/secure_storage_use_case/delete_secure_data_use_case.dart';
// import 'package:perfection_structure/core/local_storage/secure_storage/secure_storage_use_case/read_secure_data_use_case.dart';
// import 'package:perfection_structure/core/local_storage/secure_storage/secure_storage_use_case/write_secure_data_use_case.dart';
//
// import 'package:perfection_structure/core/log/app_log.dart';
//
//
// class SecureStorageProvider  {
//   final ReadSecureDataUseCase _readSecureDataUseCase;
//   final WriteSecureDataUseCase _writeSecureDataUseCase;
//   final DeleteSecureDataUseCase _deleteSecureDataUseCase;
//   final ClearSecureDataUseCase _clearSecureDataUseCase;
//
//   String _secureData = '';
//
//   String get secureData => _secureData;
//
//   SecureStorageProvider(
//       this._readSecureDataUseCase,
//       this._writeSecureDataUseCase,
//       this._clearSecureDataUseCase,
//       this._deleteSecureDataUseCase,
//       );
//
//   // Load data without using await directly in the UI
//   void loadSecureData(String key) {
//     _readSecureDataUseCase.execute(key).then((value) {
//       _secureData = value ?? 'No secure data';
//       // notifyListeners(); // Notify listeners after updating the state
//     }).catchError((e) {
//       AppLog.logValue('Error loading secure data: $e');
//     });
//   }
//
//   // Save data without using await directly in the UI
//   String saveSecureData(String key, String value) {
//     _writeSecureDataUseCase.execute(key, value).then((_) {
//       loadSecureData(key); // Reload data after saving
//     }).catchError((e) {
//       AppLog.logValue('Error saving secure data: $e');
//     });
//     return _secureData;
//   }
//
//   // delete data without using await directly in the UI
//   void deleteSecureData(String key) {
//     _deleteSecureDataUseCase.execute(key).then((_) {
//       loadSecureData(key); // Reload data after clearing
//     }).catchError((e) {
//       AppLog.logValue('Error clearing secure data: $e');
//     });
//   }
//
//   // Clear data without using await directly in the UI
//   void clearSecureData(String key) {
//     _clearSecureDataUseCase.execute().then((_) {
//       loadSecureData(key); // Reload data after clearing
//     }).catchError((e) {
//       AppLog.logValue('Error clearing secure data: $e');
//     });
//   }
// }
