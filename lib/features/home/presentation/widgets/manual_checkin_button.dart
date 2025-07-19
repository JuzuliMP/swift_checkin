import 'package:flutter/material.dart';

class ManualCheckinButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ManualCheckinButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Manual Check-in',
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}