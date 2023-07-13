import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../global/app_router/app_router.dart';
import '../../../global/data/models/course/course.dart';
import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/dot.dart';
import '../../../global/widgets/shimmer_image.dart';
import '../../../global/widgets/shimmer_wrapper.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    this.course,
  });

  final Course? course;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.pushRoute(DetailCourseRoute(id: course?.id));
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: AppColors.neutral06),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ShimmerImage(imageUrl: course?.img),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        AppIcons.filled_star,
                        color: AppColors.alertDefault,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        course?.ratingTotal.toString() ?? '_',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Text(
              course?.name ?? '_',
              style: textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
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
                    (course?.sessionTotal ?? 0).toInt(),
                    (course?.sessionTotal ?? 0).toInt().toString(),
                  ),
                  style:
                      textTheme.bodySmall?.copyWith(color: AppColors.neutral03),
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
                  course?.level ?? '_',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral03,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseTitleShimmer extends StatelessWidget {
  const CourseTitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 8),
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
