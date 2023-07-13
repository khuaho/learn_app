import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/skill_test/skill_test.dart';
import '../../../global/data/repositories/skill_test_repository.dart';

final asyncSkillTestProvider =
    AsyncNotifierProvider<AsyncCoursesNotifier, List<SkillTest>>(() {
  return AsyncCoursesNotifier();
});

class AsyncCoursesNotifier extends AsyncNotifier<List<SkillTest>> {
  late final skillTestRepository = ref.watch(skillTestRepositoryProvider);

  Future<List<SkillTest>> fetchCourse() async {
    final response = await skillTestRepository.getSkillTest();
    final data = response.fold(
      (l) {
        return null;
      },
      (r) => r,
    );
    return Future.value(data);
  }

  @override
  Future<List<SkillTest>> build() async {
    return fetchCourse();
  }
}
