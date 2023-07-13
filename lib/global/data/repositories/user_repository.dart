import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider, User;

import '../models/failure.dart';
import '../models/user.dart';
import '_base_repository.dart';

final userRepositoryProvider = Provider((_) => _UserRepositoryImpl());

abstract class UserRepository {
  Future<Either<Failure, User>> getMe();

  Future<Either<Failure, Unit>> updateMe(User data);
}

class _UserRepositoryImpl extends BaseRepository implements UserRepository {
  final supabase = Supabase.instance.client;
  @override
  Future<Either<Failure, User>> getMe() {
    return guardFuture(() async {
      final sessionUser = supabase.auth.currentSession?.user;
      final response = await supabase
          .from('users')
          .select<Map<String, dynamic>>()
          .eq('id', sessionUser?.id)
          .single();

      final data = User.fromJson(response);

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> updateMe(User data) {
    final sessionUser = supabase.auth.currentSession?.user;
    return guardFuture(() async {
      await supabase
          .from('users')
          .upsert(data.toJson())
          .eq("id", sessionUser?.id);
      return unit;
    });
  }
}
