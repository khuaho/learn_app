import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../global/app_router/app_router.dart';
import '../../global/gen/i18n.dart';
import '../../global/utils/app_icons.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: i18n.dashboard_Home,
              icon: const Icon(AppIcons.filled_home),
            ),
            BottomNavigationBarItem(
              label: i18n.dashboard_Setting,
              icon: const Icon(
                AppIcons.filled_settings_2,
              ),
            ),
          ],
        );
      },
    );
  }
}
