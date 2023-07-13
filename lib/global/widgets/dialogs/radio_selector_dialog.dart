import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../gen/i18n.dart';
import '../../themes/app_colors.dart';

class RadioSelectorDialog<T> extends StatefulWidget {
  const RadioSelectorDialog({
    super.key,
    required this.currentValue,
    required this.title,
    required this.itemLabelBuilder,
    required this.values,
  });

  final T currentValue;
  final List<T> values;
  final String title;
  final String Function(T) itemLabelBuilder;

  @override
  State<RadioSelectorDialog<T>> createState() => _RadioSelectorDialogState<T>();
}

class _RadioSelectorDialogState<T> extends State<RadioSelectorDialog<T>> {
  late T _currentValue = widget.currentValue;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...widget.values.map(
              (element) {
                return RadioListTile(
                    title: Text(widget.itemLabelBuilder(element)),
                    value: element,
                    contentPadding: EdgeInsets.zero,
                    groupValue: _currentValue,
                    onChanged: (value) {
                      setState(() {
                        _currentValue = element;
                      });
                    });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: AutoRouter.of(context).pop,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.neutral04.withOpacity(0.7),
                    ),
                    child: Text(i18n.button_Cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () => AutoRouter.of(context).pop(_currentValue),
                    child: Text(i18n.button_Ok),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
