import 'package:flutter/material.dart';

class WorkTypeSelector extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onChanged;

  const WorkTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: RadioListTile<String>(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Budget',
              style: theme.textTheme.titleSmall,
            ),
            value: 'Budget',
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: theme.colorScheme.primary,
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Issue',
              style: theme.textTheme.titleSmall,
            ),
            value: 'Issue',
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
