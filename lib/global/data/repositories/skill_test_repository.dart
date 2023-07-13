import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/failure.dart';
import '../models/skill_test/skill_test.dart';
import '_base_repository.dart';

final skillTestRepositoryProvider = Provider((_) => _SkillTestRepositoryImpl());

abstract class SkillTestRepository {
  Future<Either<Failure, List<SkillTest>>> getSkillTest();
}

class _SkillTestRepositoryImpl extends BaseRepository
    implements SkillTestRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<SkillTest>>> getSkillTest() {
    return guardFuture(() async {
      final response =
          await supabase.from('skill_tests').select<PostgrestList>();
      final data = response.map((e) => SkillTest.fromJson(e)).toList();
      return data;
    });
  }
}
