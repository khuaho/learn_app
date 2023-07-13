import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_app/global/app_router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider, User;

import '../../global/enums/app_locale.dart';
import '../../global/enums/app_theme.dart';
import '../../global/gen/i18n.dart';
import '../../global/providers/app_settings_provider.dart';
import '../../global/providers/user_provider.dart';
import '../../global/themes/app_colors.dart';
import '../../global/utils/app_icons.dart';
import '../../global/widgets/avatar.dart';
import '../../global/widgets/dialogs/radio_selector_dialog.dart';
import 'providers/setting_provider.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final supabase = Supabase.instance.client;

  Future<void> changeLanguageHandler() async {
    final i18n = I18n.of(context)!;
    final appSettingsController = ref.read(appSettingProvider.notifier);
    final currentLocale = ref.read(appSettingProvider).locale.getLabel(i18n);
    final locale = await showDialog<String>(
      context: context,
      builder: (_) => RadioSelectorDialog(
        currentValue: currentLocale,
        itemLabelBuilder: (item) => item,
        title: i18n.setting_Language,
        values: i18n.language,
      ),
    );

    if (locale != currentLocale && locale != null) {
      if (locale == AppLocale.viVN.getLabel(i18n)) {
        appSettingsController.changeLocale(AppLocale.viVN);
      } else {
        appSettingsController.changeLocale(AppLocale.enUs);
      }
    }
  }

  void logout() {
    final settingPro = ref.read(settingProvider.notifier);
    settingPro.logout();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final i18n = I18n.of(context)!;
    final user = ref.watch(userProvider).value;
    final supabaseAuth = Supabase.instance.client.auth;

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.dashboard_Setting),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.push(const AccountRoute());
                  },
                  child: Avatar(
                    avatar: user?.avatar,
                    size: 60,
                    userName: user?.fullName,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user?.fullName ?? '_',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(supabaseAuth.currentUser?.email ?? '_')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              i18n.setting_Preferences.toUpperCase(),
              style: const TextStyle(
                color: AppColors.neutral03,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: changeLanguageHandler,
                  child: Row(
                    children: [
                      const Icon(
                        AppIcons.filled_globe,
                        color: AppColors.neutral03,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        i18n.setting_Language,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(ref.watch(appSettingProvider).locale.getLabel(i18n)),
                      const SizedBox(width: 6),
                      const Icon(
                        AppIcons.filled_arrow_ios_forward,
                        color: AppColors.neutral03,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      AppIcons.outlined_moon,
                      color: AppColors.neutral03,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      ref.watch(appSettingProvider).theme.themeLabel(i18n),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Switch.adaptive(
                      activeColor: AppColors.primary,
                      value:
                          ref.watch(appSettingProvider).theme == AppTheme.dark,
                      onChanged: (_) {
                        final appSettingsController =
                            ref.read(appSettingProvider.notifier);
                        appSettingsController.toggleTheme();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'MORE',
              style: TextStyle(
                color: AppColors.neutral03,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: help & support
                  },
                  child: Row(
                    children: [
                      const Icon(
                        AppIcons.filled_working_remote,
                        color: AppColors.neutral03,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        i18n.setting_HelpAndSupport,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        AppIcons.filled_arrow_ios_forward,
                        color: AppColors.neutral03,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // TODO: about app
                  },
                  child: Row(
                    children: [
                      const Icon(
                        AppIcons.filled_collapse,
                        color: AppColors.neutral03,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        i18n.setting_AboutApp,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        AppIcons.filled_arrow_ios_forward,
                        color: AppColors.neutral03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: logout,
          child: Text(i18n.button_Logout),
        ),
      ),
    );
  }
}
