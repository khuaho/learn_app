import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/gen/i18n.dart';
import '../../global/themes/app_colors.dart';
import '../../global/widgets/filter/filter_text_field.dart';
import 'widgets/home_overview.dart';
import 'widgets/popular_courses.dart';
import 'widgets/popular_skill_test.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            isDark ? AppColors.backgroundDark : AppColors.neutral20,
        title: Text(
          i18n.home_Title,
          style: textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              isLabelVisible: true,
              label: Text(
                '2',
                style: TextStyle(color: AppColors.white),
              ),
              textStyle: TextStyle(fontSize: 12),
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilterTextField(
                  hintText: i18n.common_Search,
                  onTextChange: (value) {
                    // TODO: search
                    // filter.copyWith(keyword: text),
                  },
                ),
                const SizedBox(height: 16),
                const HomeOverview(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: isDark ? AppColors.black : AppColors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  PopularCourse(),
                  SizedBox(height: 12),
                  Expanded(
                    child: PopularSkillTests(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
