import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_checkin/features/home/presentation/cubit/home_cubit.dart';

class WorkingHoursCard extends StatelessWidget {
  const WorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
           Text(
            'Working Hours',
              style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary.withOpacity(0.6)),
          ),
          const SizedBox(height: 8),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              String timeText = "00:00:00 Hrs";
              if (state is HomeTimerUpdate) {
                timeText = "${context.read<HomeCubit>().formatDuration(state.workingTime)} Hrs";
              }
              return Text(
                timeText,
                style: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onPrimary),
              );
            },
          ),
        ],
      ),
    );
  }
}