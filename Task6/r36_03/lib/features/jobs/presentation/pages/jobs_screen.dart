import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/jobs/presentation/cubit/jobs_cubit.dart';
import 'package:task_6/features/jobs/presentation/pages/widgets/job_card.dart';
import 'package:task_6/features/jobs/presentation/pages/widgets/job_shimmer.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('job Board'), centerTitle: true),
      body: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) {
          if (state is JobsLoadingState || state is JobsInitialState) {
            return const JobShimmer();
          } else if (state is JobsLoadedState) {
            return ListView.builder(
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: state.jobs[index]);
              },
            );
          } else if (state is JobsErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<JobsCubit>().fetchJobs();
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
