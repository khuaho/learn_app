import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_router.dart';

// ignore: deprecated_member_use
class AuthGuard extends AutoRedirectGuard {
  AuthGuard() {
    final supabase = Supabase.instance.client;
    supabase.auth.onAuthStateChange.listen((data) {
      // final AuthChangeEvent event = data.event;
      // final Session? session = data.session;

      reevaluate();
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await canNavigate(resolver.route)) return resolver.next();
    await router.replaceAll([
      const LoginRoute(),
    ]);
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return Supabase.instance.client.auth.currentSession != null;
  }
}
