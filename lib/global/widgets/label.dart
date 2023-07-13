import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class Label extends StatelessWidget {
  const Label(
    this.data, {
    Key? key,
    this.isRequired = false,
    this.maxLines,
    this.paddingTop = 18,
  }) : super(key: key);

  final String data;
  final bool isRequired;
  final int? maxLines;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: paddingTop),
      child: Text.rich(
        TextSpan(
          text: data,
          style: theme.textTheme.titleSmall,
          children: [
            TextSpan(
              text: isRequired ? ' *' : '',
              style: const TextStyle(color: AppColors.errorDefault),
            ),
          ],
        ),
        maxLines: maxLines,
      ),
    );
  }
}
