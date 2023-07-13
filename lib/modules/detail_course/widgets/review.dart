import 'package:flutter/material.dart';

import '../../../global/data/models/course/course.dart';
import 'review_tile.dart';

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.data,
  });

  final Course data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ReviewTile(),
        ReviewTile(),
        ReviewTile(),
      ],
    );
  }
}
