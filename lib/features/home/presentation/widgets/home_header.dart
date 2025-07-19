import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey Jose',
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.surface),
            ),
            Text(
              'Tuesday 17 June, 2025',
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: theme.colorScheme.surface),
            ),
          ],
        ),
        Image.asset(
          'assets/images/dp.png',
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
