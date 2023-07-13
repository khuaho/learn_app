import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';

final userProvider = FutureProvider.autoDispose<User?>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);

  final data = await userRepository.getMe();

  final user = data.fold((l) {
    return null;
  }, (r) {
    return r;
  });
  return user;
});
