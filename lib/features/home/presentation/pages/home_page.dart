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
      builder: (context) => CheckinDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(22)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  theme.colorScheme.onPrimary,
                  theme.colorScheme.primary.withOpacity(0.6),
                ],
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
          color: theme.colorScheme.surface,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.file_download_outlined),
            color: theme.colorScheme.surface,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(340),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(height: 32),
                const WorkingHoursCard(),
                const SizedBox(height: 24),
                ManualCheckinButton(onPressed: _showCheckinDialog),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
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
