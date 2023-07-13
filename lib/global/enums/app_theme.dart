import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../gen/i18n.dart';
import '../themes/app_themes.dart';

enum AppTheme {
  auto('auto'),
  light('light'),
  dark('dark');

  final String value;
  const AppTheme(this.value);

  static AppTheme fromValue(String? value) {
    return AppTheme.values.firstWhere(
      (e) => e.value == value,
      orElse: () => auto,
    );
  }

  ThemeData toThemeData() {
    switch (this) {
      case light:
        return AppThemes.light();
      case dark:
        return AppThemes.dark();
      case auto:
        final isDark = SchedulerBinding.instance.window.platformBrightness ==
            Brightness.dark;
        return isDark ? AppThemes.dark() : AppThemes.light();
    }
  }

  String themeLabel(I18n i18n) {
    switch (this) {
      case light:
        return i18n.setting_Mode[1];
      case dark:
        return i18n.setting_Mode[0];
      case auto:
        return i18n.setting_Mode[2];
    }
  }
}
