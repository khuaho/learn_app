import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/repositories/auth_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, AppState<Unit>>(
  SignUpProvider.new,
);

class SignUpProvider extends StateNotifier<AppState<Unit>> {
  SignUpProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  void signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    state = AppState.loading();
    authRepository
        .signUpWithEmailPassword(
          fullName: fullName,
          email: email,
          password: password,
        )
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
