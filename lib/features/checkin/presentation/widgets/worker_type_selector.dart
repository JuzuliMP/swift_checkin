import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkerTypeSelector extends StatelessWidget {
  const WorkerTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/worker.svg'),
          const SizedBox(height: 8),
          Text(
            'Worker',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}