import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/app_settings.dart';
import '../data/repositories/app_settings_repository.dart';
import '../enums/app_locale.dart';
import '../enums/app_theme.dart';
import '../gen/i18n.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingsProvider, AppSettings>(
  (ref) => AppSettingsProvider(
    ref.watch(appSettingsRepositoryProvider),
  ),
);

class AppSettingsProvider extends StateNotifier<AppSettings> {
  AppSettingsProvider(this._hiveService)
      : super(
          _hiveService.getAppSettings().fold(
                (l) => const AppSettings(),
                (r) => r,
              ),
        );

  final AppSettingsRepository _hiveService;

  ThemeData get themeData => state.theme.toThemeData();

  void getAppSettings() async {
    _hiveService.getAppSettings().fold((l) => null, (r) => state = r);
  }

  void changeTheme(AppTheme theme) async {
    _hiveService.saveTheme(theme).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void toggleTheme() async {
    final theme = state.theme == AppTheme.dark ? AppTheme.light : AppTheme.dark;
    await _hiveService.saveTheme(theme).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void changeLocale(AppLocale locale) async {
    await _hiveService.saveLocale(locale).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
    I18n.locale = locale.toLocale();
  }

  void reset() async {
    await _hiveService.resetAppSettings().then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }
}
