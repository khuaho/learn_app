import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/gen/i18n.dart';
import '../../global/themes/app_colors.dart';
import '../../global/widgets/avatar.dart';
import '../../global/widgets/shimmer_image.dart';
import 'provider/detail_course_provider.dart';
import 'widgets/detail.dart';
import 'widgets/review.dart';

@RoutePage()
class DetailCoursePage extends ConsumerStatefulWidget {
  const DetailCoursePage({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  ConsumerState<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends ConsumerState<DetailCoursePage>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final asyncCourse = ref.watch(courseProvider.call(widget.id!));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // TODO:
            },
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: asyncCourse.when(
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.square(
                      dimension: 100,
                      child: ShimmerImage(
                        imageUrl: data.img,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(data.name ?? '_', style: textTheme.titleLarge),
                    const SizedBox(height: 12),
                    Text(data.description ?? '_'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: Avatar(
                            size: 30,
                            avatar: data.author?['avatar'],
                            userName: data.author?['name'],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          data.author?['name'],
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TabBar(
                          controller: tabController,
                          indicator: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          tabs: [
                            Tab(text: i18n.course_Detail),
                            Tab(text: i18n.course_Review),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Detail(data: data),
                            Review(data: data),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Text('Error: $err'),
      ),
    );
  }
}
