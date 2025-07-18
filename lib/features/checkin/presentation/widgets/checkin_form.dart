import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/checkin_cubit.dart';
import 'worker_type_selector.dart';
import 'dropdown_field.dart';
import 'work_type_selector.dart';

class CheckinForm extends StatefulWidget {
  const CheckinForm({super.key});

  @override
  State<CheckinForm> createState() => _CheckinFormState();
}

class _CheckinFormState extends State<CheckinForm> {
  String _selectedProject = '';
  String _selectedGate = '';
  String _selectedWorkType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WorkerTypeSelector(),
        const SizedBox(height: 24),
        DropdownField(
          label: 'Projects',
          value: _selectedProject,
          items: const ['Project A', 'Project B', 'Project C'],
          onChanged: (value) {
            setState(() {
              _selectedProject = value ?? '';
            });
          },
        ),
        const SizedBox(height: 16),
        DropdownField(
          label: 'Gates',
          value: _selectedGate,
          items: const ['Gate 1', 'Gate 2', 'Gate 3'],
          onChanged: (value) {
            setState(() {
              _selectedGate = value ?? '';
            });
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Select Work Type',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        WorkTypeSelector(
          selectedType: _selectedWorkType,
          onChanged: (value) {
            setState(() {
              _selectedWorkType = value;
            });
          },
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: BlocBuilder<CheckinCubit, CheckinState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state is CheckinLoading
                    ? null
                    : () {
                  context.read<CheckinCubit>().performCheckin(
                    project: _selectedProject,
                    gate: _selectedGate,
                    workType: _selectedWorkType,
                  );
                },
                child: state is CheckinLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : const Text('Check-in'),
              );
            },
          ),
        ),
      ],
    );
  }
}
