import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/category/category.dart';
import '../../../global/data/repositories/category_repository.dart';

final asyncCategoryProvider =
    AsyncNotifierProvider<AsyncCategoryNotifier, List<Category>>(() {
  return AsyncCategoryNotifier();
});

class AsyncCategoryNotifier extends AsyncNotifier<List<Category>> {
  late final skillTestRepository = ref.watch(categoryRepositoryProvider);

  Future<List<Category>> fetchCategories() async {
    final response = await skillTestRepository.getCategories();
    final data = response.fold(
      (l) {
        return null;
      },
      (r) => r,
    );
    return Future.value(data);
  }

  @override
  Future<List<Category>> build() async {
    return fetchCategories();
  }
}
