import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/failure.dart';
import '_base_repository.dart';

final authRepositoryProvider = Provider(_AuthRepositoryImpl.new);

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();
}

class _AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  _AuthRepositoryImpl(this.ref);

  Ref ref;

  final supabaseAuth = Supabase.instance.client.auth;

  @override
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    return guardFuture(() async {
      await supabaseAuth.signInWithPassword(
        email: email,
        password: password,
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signOut() {
    return guardFuture(() async {
      await supabaseAuth.signOut();
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) {
    return guardFuture(() async {
      final oauthCredential = await supabaseAuth.signUp(
        email: email,
        password: password,
        // emailRedirectTo:
        //     kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );

      if (oauthCredential.user != null) {
        await supabaseAuth.updateUser(
          UserAttributes(data: {'full_name': fullName}),
        );
      }
      return unit;
    });
  }
}
