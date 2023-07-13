import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/course/course.dart';
import '../../../global/data/repositories/course_repository.dart';

final asyncCourseProvider =
    AsyncNotifierProvider<AsyncCoursesNotifier, List<Course>>(() {
  return AsyncCoursesNotifier();
});

class AsyncCoursesNotifier extends AsyncNotifier<List<Course>> {
  late final courseRepository = ref.watch(courseRepositoryProvider);

  Future<List<Course>> fetchCourse() async {
    final response = await courseRepository.getCourses();
    final data = response.fold(
      (l) {
        return null;
      },
      (r) => r,
    );
    return Future.value(data);
  }

  @override
  Future<List<Course>> build() async {
    return fetchCourse();
  }
}
