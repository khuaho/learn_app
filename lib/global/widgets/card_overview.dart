import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'shimmer_wrapper.dart';

class CardOverview extends StatelessWidget {
  const CardOverview({
    Key? key,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                if (subTitle != null)
                  Text(
                    subTitle ?? '_',
                    style: textTheme.headlineSmall,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerCardOverview extends StatelessWidget {
  const ShimmerCardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
