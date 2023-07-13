import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final appAuthProvider = StreamProvider((ref) async* {
  final supabase = Supabase.instance.client;
  final authStream = supabase.auth.onAuthStateChange;
  await for (final user in authStream) {
    if (user == null) {
      yield false;
    } else {
      yield true;
    }
  }
});
