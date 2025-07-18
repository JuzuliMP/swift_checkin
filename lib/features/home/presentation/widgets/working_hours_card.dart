import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

class WorkingHoursCard extends StatelessWidget {
  const WorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF666666),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Working Hours',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              String timeText = "00:00:00 Hrs";
              if (state is HomeTimerUpdate) {
                timeText = "${context.read<HomeCubit>().formatDuration(state.workingTime)} Hrs";
              }
              return Text(
                timeText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}