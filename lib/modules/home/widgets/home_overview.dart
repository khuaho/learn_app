import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_app/global/extensions/category_extension.dart';

import '../../../global/gen/i18n.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/card_overview.dart';
import '../providers/category_provider.dart';

class HomeOverview extends ConsumerWidget {
  const HomeOverview({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final asyncCategories = ref.watch(asyncCategoryProvider);
    const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      mainAxisExtent: 50,
    );
    return asyncCategories.when(
      data: (data) {
        final items = [
          CardOverview(
            title: data[0].label(I18n.locale!) ?? '_',
            icon: AppIcons.filled_shopping_bag,
            iconColor: AppColors.information,
            iconBackgroundColor: AppColors.informationSoft,
          ),
          CardOverview(
            title: data[1].label(I18n.locale!) ?? '_',
            icon: AppIcons.filled_shuffle,
            iconColor: AppColors.successDefault,
            iconBackgroundColor: AppColors.successSoft,
          ),
          CardOverview(
            title: data[2].label(I18n.locale!) ?? '_',
            icon: AppIcons.filled_archive,
            iconColor: AppColors.warningDefault,
            iconBackgroundColor: AppColors.warningSoft,
          ),
          CardOverview(
            title: data[3].label(I18n.locale!) ?? '_',
            icon: AppIcons.filled_heart,
            iconColor: AppColors.heartDefault,
            iconBackgroundColor: AppColors.errorSoft,
          ),
        ];

        if (data.isEmpty) {
          return const Text('No data');
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          gridDelegate: gridDelegate,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        );
      },
      loading: () => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        gridDelegate: gridDelegate,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ShimmerCardOverview();
        },
      ),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
