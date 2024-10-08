extension StringValidation on String {
  bool get isValidEmail {
    // Simple regex for email validation
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(this);
  }

  bool get isNotEmptyOrNull => isNotEmpty;
}

extension StringManipulation on String {
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get reverse {
    return split('').reversed.join();
  }
}

extension StringConversion on String {
  int? toIntOrNull() {
    return int.tryParse(this);
  }

  double? toDoubleOrNull() {
    return double.tryParse(this);
  }
}
