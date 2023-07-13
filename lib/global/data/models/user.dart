import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    String? id,
    String? fullName,
    String? avatar,
    String? email,
    String? username,
    String? phoneNumber,
    String? gender,
    DateTime? dateOfBirth,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'avatar': avatar,
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
      };
}
