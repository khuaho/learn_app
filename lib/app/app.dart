import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import '../global/app_router/app_router.dart';
import '../global/gen/i18n.dart';
import '../global/providers/app_settings_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // ConnectionStatusSingleton connectionStatus =
  //     ConnectionStatusSingleton.getInstance();
  // connectionStatus.initialize(ref);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       bool result = await InternetConnectionChecker().hasConnection;
  //       if (result == true) {
  //         ref.invalidate(eventsProvider);
  //       }
  //       break;
  //     default:
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    FormBuilderLocalizations.delegate.load(const Locale('en', 'US'));
    // final isAuth = ref.watch(appAuthProvider).value;

    return MaterialApp.router(
      title: 'Supabase Example',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      locale: ref.watch(appSettingProvider).locale.toLocale(),
      localeResolutionCallback: I18n.delegate.resolution(
        fallback: const Locale('en'),
      ),
      theme: ref.watch(appSettingProvider).theme.toThemeData(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
