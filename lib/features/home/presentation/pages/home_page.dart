import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_checkin/features/checkin/presentation/pages/checkin_dialog.dart';
import 'package:swift_checkin/features/home/presentation/cubit/home_cubit.dart';
import 'package:swift_checkin/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:swift_checkin/features/home/presentation/widgets/home_header.dart';
import 'package:swift_checkin/features/home/presentation/widgets/manual_checkin_button.dart';
import 'package:swift_checkin/features/home/presentation/widgets/working_hours_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().startTimer();
  }

  void _showCheckinDialog() {
    showDialog(
      context: context,
      builder: (context) => const CheckinDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 32),
              const WorkingHoursCard(),
              const SizedBox(height: 24),
              ManualCheckinButton(onPressed: _showCheckinDialog),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}