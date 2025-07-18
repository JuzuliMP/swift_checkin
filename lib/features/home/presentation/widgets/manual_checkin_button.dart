import 'package:flutter/material.dart';

class ManualCheckinButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ManualCheckinButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Manual Check-in',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}