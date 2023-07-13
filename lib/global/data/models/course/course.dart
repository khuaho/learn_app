import 'package:freezed_annotation/freezed_annotation.dart';

import '../knowledge_learn/knowledge_learn.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const Course._();

  factory Course({
    int? id,
    String? name,
    String? img,
    int? sessionId,
    Map<String, dynamic>? session,
    String? level,
    String? description,
    String? authorId,
    Map<String, dynamic>? author,
    double? ratingTotal,
    double? estimateTime,
    List<KnowledgeLearn>? knowledgeLearn,
    String? reviewId,
    List<Map<String, dynamic>>? reviews,
    double? sessionTotal,
    double? ratings,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
