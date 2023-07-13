import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/repositories/auth_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginProvider, AppState<Unit>>(
  LoginProvider.new,
);

class LoginProvider extends StateNotifier<AppState<Unit>> {
  LoginProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  void signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    state = AppState.loading();
    authRepository
        .signInWithEmailPassword(email: email, password: password)
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }

  // void signInWithGoogle() {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   state = AppState.loading();
  //   authRepository.signInWithGoogle().then(
  //         (either) => either.fold(
  //           (l) => state = AppState.error(l),
  //           (r) => state = AppState.data(r),
  //         ),
  //       );
  // }

  // void signInWithApple() {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   state = AppState.loading();
  //   authRepository.signInWithApple().then(
  //         (either) => either.fold(
  //           (l) => state = AppState.error(l),
  //           (r) => state = AppState.data(r),
  //         ),
  //       );
  // }

  // void signInWithFacebook() {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   state = AppState.loading();
  //   authRepository.signInWithFacebook().then(
  //         (either) => either.fold(
  //           (l) => state = AppState.error(l),
  //           (r) => state = AppState.data(r),
  //         ),
  //       );
  // }
}
