import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../providers/skill_test_provider.dart';
import 'skill_test_tile.dart';

class PopularSkillTests extends ConsumerWidget {
  const PopularSkillTests({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final asyncSkillTests = ref.watch(asyncSkillTestProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                i18n.home_PopularSkillTests,
                style: textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  // Popular Courses
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
          asyncSkillTests.when(
            data: (data) => SizedBox(
              height: 225,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (_, index) {
                  final item = data[index];
                  return SkillTestTile(data: item);
                },
              ),
            ),
            loading: () => SizedBox(
              height: 225,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, index) {
                  return const SkillTestTitleShimmer();
                },
              ),
            ),
            error: (err, stack) => Text('Error: $err'),
          )
        ],
      ),
    );
  }
}
