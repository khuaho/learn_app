import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unknown(Object data) = _unknownFailure;

  const factory Failure.authSupabase(AuthException e) = _authSupabaseFailure;

  const factory Failure.illegalData(String err) = _illegalDataFailure;

  const factory Failure.network() = _networkFailure;

  const factory Failure.permissionDenied() = _permissionDeniedFailure;

  const factory Failure.postgrest(PostgrestException e) = _postgrestFailure;

  const factory Failure.other(String message) = _otherFailure;
}
