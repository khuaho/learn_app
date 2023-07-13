import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../providers/course_provider.dart';
import 'course_tile.dart';

class PopularCourse extends ConsumerWidget {
  const PopularCourse({super.key});

  @override
  Widget build(context, ref) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final asyncCourses = ref.watch(asyncCourseProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              i18n.home_PopularCourses,
              style: textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {
                // TODO:
              },
              child: Text(
                i18n.button_SeeAll,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  color: AppColors.information,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        asyncCourses.when(
          data: (data) => SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (_, index) {
                final item = data[index];
                return CourseTile(course: item);
              },
            ),
          ),
          loading: () => SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (_, index) {
                return const CourseTitleShimmer();
              },
            ),
          ),
          error: (err, stack) => Text(err.toString()),
        ),
      ],
    );
  }
}
