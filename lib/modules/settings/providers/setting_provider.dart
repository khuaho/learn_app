import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/repositories/auth_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final settingProvider = StateNotifierProvider<SettingProvider, AppState<Unit>>(
  SettingProvider.new,
);

class SettingProvider extends StateNotifier<AppState<Unit>> {
  SettingProvider(this.ref) : super(AppState.initial());

  final Ref ref;

  late final authRepository = ref.watch(authRepositoryProvider);

  void logout() {
    state = AppState.loading();
    authRepository.signOut().then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
