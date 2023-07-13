import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/course/course.dart';
import '../../../global/data/repositories/course_repository.dart';

final courseProvider =
    FutureProvider.autoDispose.family<Course, int>((ref, courseId) async {
  final courseRepository = ref.watch(courseRepositoryProvider);
  final response = await courseRepository.getCourse(courseId);

  final data = response.fold(
    (l) => null,
    (r) => r,
  );

  return Future.value(data);
});
