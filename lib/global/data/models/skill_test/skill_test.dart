import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_test.freezed.dart';
part 'skill_test.g.dart';

@freezed
class SkillTest with _$SkillTest {
  const SkillTest._();

  factory SkillTest({
    int? id,
    String? name,
    String? img,
    double? totalQuestion,
    double? totalParticipant,
  }) = _SkillTest;

  factory SkillTest.fromJson(Map<String, dynamic> json) =>
      _$SkillTestFromJson(json);
}
