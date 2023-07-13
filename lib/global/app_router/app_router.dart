import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../modules/auth/account_page.dart';
import '../../modules/auth/login_page.dart';
import '../../modules/auth/signup_page.dart';
import '../../modules/dashboard/dashboard_page.dart';
import '../../modules/detail_course/detail_course_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/settings/settings_page.dart';
import '../../modules/splash/splash_page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/signup', page: SignUpRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page)
          ],
        ),
        AutoRoute(
          path: '/detail_courses',
          page: DetailCourseRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          path: '/account',
          page: AccountRoute.page,
          guards: [AuthGuard()],
        ),
      ];
}
