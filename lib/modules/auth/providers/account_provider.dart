import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/data/models/user.dart';
import '../../../global/data/repositories/auth_repository.dart';
import '../../../global/data/repositories/upload_repository.dart';
import '../../../global/data/repositories/user_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final accountNotifierProvider =
    StateNotifierProvider<AccountNotifierProvider, AppState<Unit>>(
  AccountNotifierProvider.new,
);

class AccountNotifierProvider extends StateNotifier<AppState<Unit>> {
  AccountNotifierProvider(this.ref) : super(AppState.initial());

  final Ref ref;

  late final authRepository = ref.watch(authRepositoryProvider);
  late final uploadRepository = ref.watch(uploadRepositoryProvider);
  late final userRepository = ref.watch(userRepositoryProvider);

  Future<String> getUrlImage(XFile? imageFile) async {
    state = AppState.loading();
    final response = await uploadRepository.getImageUrl(imageFile);
    final urlImage = response.fold((l) {
      state = AppState.error(l);
      return null;
    }, (r) {
      return r;
    });
    return Future.value(urlImage);
  }

  void updateProfile(User data) {
    FocusManager.instance.primaryFocus?.unfocus();
    state = AppState.loading();
    userRepository.updateMe(data).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
