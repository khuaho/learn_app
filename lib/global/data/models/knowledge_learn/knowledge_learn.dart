import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_learn.freezed.dart';
part 'knowledge_learn.g.dart';

@freezed
class KnowledgeLearn with _$KnowledgeLearn {
  const KnowledgeLearn._();

  factory KnowledgeLearn({
    String? en,
    String? vi,
  }) = _KnowledgeLearn;

  factory KnowledgeLearn.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeLearnFromJson(json);
}
