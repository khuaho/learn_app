import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/avatar.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Avatar(
                userName: 'Khua',
                size: 46,
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alec Whisterm',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                    itemBuilder: (context, _) => const Icon(
                      AppIcons.filled_star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '19 hour ago',
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral03,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('It sgdfhdsfh dhbh dshfvgdhsh')
        ],
      ),
    );
  }
}
