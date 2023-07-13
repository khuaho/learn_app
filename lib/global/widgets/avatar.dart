import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'shimmer_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.userName,
    this.avatar,
    this.size = 40.0,
    this.textSize = 10,
  }) : super(key: key);
  final String? userName;
  final String? avatar;
  final double size;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: avatar != null
            ? ShimmerImage(
                imageUrl: avatar ?? '',
                fit: BoxFit.cover,
              )
            : Container(
                color: AppColors.grey6,
                alignment: Alignment.center,
                child: Text(
                  userName?.substring(0, 1).toUpperCase() ?? '',
                  style: TextStyle(
                    height: 1,
                    fontSize: textSize,
                    color: AppColors.grey2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
