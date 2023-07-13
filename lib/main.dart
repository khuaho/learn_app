import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'firebase_options.dart';
import 'global/utils/constants.dart';

void main() {
  buildApp();
}

Future<void> buildApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>(Constants.hiveDataBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: Constants.supabase_url,
    anonKey: Constants.supabase_non_key,
    // authFlowType: AuthFlowType.pkce,
    authCallbackUrlHostname: 'login-callback',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
