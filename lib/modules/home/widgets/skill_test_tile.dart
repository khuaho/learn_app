import 'package:flutter/material.dart';

import '../../../global/data/models/skill_test/skill_test.dart';
import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/avatar.dart';
import '../../../global/widgets/dot.dart';
import '../../../global/widgets/shimmer_wrapper.dart';

class SkillTestTile extends StatelessWidget {
  const SkillTestTile({
    super.key,
    this.data,
  });

  final SkillTest? data;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: AppColors.neutral06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Avatar(
            avatar: data?.img,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.name ?? '_',
                style: textTheme.titleSmall,
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
                    i18n.common_Plural_Question(
                      (data?.totalQuestion ?? 0).toInt(),
                      (data?.totalQuestion ?? 0).toInt().toString(),
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral03,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Dot(color: AppColors.neutral03),
                  const SizedBox(width: 6),
                  const Icon(
                    AppIcons.filled_people,
                    color: AppColors.neutral03,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    i18n.common_Plural_Participant(
                      (data?.totalParticipant ?? 0).toInt(),
                      (data?.totalParticipant ?? 0).toInt().toString(),
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral03,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SkillTestTitleShimmer extends StatelessWidget {
  const SkillTestTitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral06),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
