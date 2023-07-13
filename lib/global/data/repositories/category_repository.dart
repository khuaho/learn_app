import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/category/category.dart';
import '../models/failure.dart';
import '_base_repository.dart';

final categoryRepositoryProvider = Provider((_) => _CategoryRepositoryImpl());

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}

class _CategoryRepositoryImpl extends BaseRepository
    implements CategoryRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<Category>>> getCategories() {
    return guardFuture(() async {
      final response =
          await supabase.from('categories').select<PostgrestList>();
      final data = response.map((e) => Category.fromJson(e)).toList();
      return data;
    });
  }
}
