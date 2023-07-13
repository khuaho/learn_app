import 'package:flutter/material.dart';
import 'package:learn_app/global/extensions/double_extension.dart';
import 'package:learn_app/global/extensions/knowledge_learn_extension.dart';
import 'package:numeral/numeral.dart';

import '../../../global/data/models/course/course.dart';
import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/dot.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.data,
  });

  final Course data;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral06),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    AppIcons.filled_star,
                    color: AppColors.alertDefault,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.ratingTotal.toString(),
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(${i18n.common_Plural_Rating(
                      (data.ratings ?? 0).toInt(),
                      Numeral(data.ratings ?? 0).format(),
                    )})',
                    style: const TextStyle(
                      color: AppColors.neutral03,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    AppIcons.filled_time,
                    color: AppColors.neutral03,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data.estimateTime?.toStringWithHours(i18n) ?? '_',
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.neutral03,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    AppIcons.filled_play_circle,
                    color: AppColors.neutral03,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    i18n.common_Plural_Session(
                      (data.sessionTotal ?? 0).toInt(),
                      (data.sessionTotal ?? 0).toInt().toString(),
                    ),
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.neutral03,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Dot(color: AppColors.neutral03),
                  const SizedBox(width: 6),
                  const Icon(
                    AppIcons.filled_assessment,
                    color: AppColors.neutral03,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data.level ?? '_',
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.neutral03,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          i18n.course_WhatYouWillLearn,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Column(
          children: data.knowledgeLearn!.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    AppIcons.filled_checkmark,
                    color: AppColors.information,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      e.knowledgeContent(I18n.locale!) ?? '_',
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
