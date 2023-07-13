import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/course/course.dart';
import '../models/failure.dart';
import '_base_repository.dart';

final courseRepositoryProvider = Provider((_) => _CourseRepositoryImpl());

abstract class CourseRepository {
  Future<Either<Failure, List<Course>>> getCourses();

  Future<Either<Failure, Course>> getCourse(int id);
}

class _CourseRepositoryImpl extends BaseRepository implements CourseRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<Course>>> getCourses() {
    return guardFuture(() async {
      final response = await supabase.from('courses').select<PostgrestList>();
      final data = response.map((e) => Course.fromJson(e)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, Course>> getCourse(int id) {
    return guardFuture(() async {
      final response = await supabase
          .from('courses')
          .select<Map<String, dynamic>>()
          .eq('id', id)
          .single();

      final data = Course.fromJson(response);
      return data;
    });
  }
}
