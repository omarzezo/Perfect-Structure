import 'package:flutter/material.dart';
import 'package:perfection_structure/shared/theme/theme_manager.dart';
import 'package:provider/provider.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => watch<ThemeManager>().currentTheme;
}
