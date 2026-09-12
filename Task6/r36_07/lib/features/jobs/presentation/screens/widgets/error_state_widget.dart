import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/jobs_cubit.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi_off, size: 72, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong.',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => context.read<JobsCubit>().loadJobs(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
