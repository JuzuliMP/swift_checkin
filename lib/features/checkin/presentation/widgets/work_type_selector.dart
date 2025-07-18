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
    return Row(
      children: [
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Budget'),
            value: 'Budget',
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: const Color(0xFFE67E22),
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Issue'),
            value: 'Issue',
            groupValue: selectedType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: const Color(0xFFE67E22),
          ),
        ),
      ],
    );
  }
}