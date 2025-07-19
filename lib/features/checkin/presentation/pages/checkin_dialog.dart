import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_checkin/features/checkin/presentation/cubit/checkin_cubit.dart';
import 'package:swift_checkin/features/checkin/presentation/widgets/checkin_form.dart';

/// A dialog for starting a check-in process.
/// Shows feedback on success or error via SnackBar.
class CheckinDialog extends StatelessWidget {
  const CheckinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: BlocListener<CheckinCubit, CheckinState>(
        listener: _handleCheckinState,
        child: const _CheckinDialogContent(),
      ),
    );
  }

  /// Handles check-in state changes and shows appropriate feedback.
  void _handleCheckinState(BuildContext context, CheckinState state) {
    if (state is CheckinSuccess) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Check-in started successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (state is CheckinError) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

/// The main content of the check-in dialog, extracted for clarity and reusability.
class _CheckinDialogContent extends StatelessWidget {
  const _CheckinDialogContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DialogHeader(),
          SizedBox(height: 8),
          _DialogTitle(),
          SizedBox(height: 8),
          _DialogSubtitle(),
          SizedBox(height: 16),
          CheckinForm(),
        ],
      ),
    );
  }
}

/// The header row with a back button.
class _DialogHeader extends StatelessWidget {
  const _DialogHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, size: 16),
        ),
        const Spacer(),
      ],
    );
  }
}

/// The main title of the dialog.
class _DialogTitle extends StatelessWidget {
  const _DialogTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Check-in',
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

/// The subtitle prompting the user to select a check-in type.
class _DialogSubtitle extends StatelessWidget {
  const _DialogSubtitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Select Check-in Type',
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
