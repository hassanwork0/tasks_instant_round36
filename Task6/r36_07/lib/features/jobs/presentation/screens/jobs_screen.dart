import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/jobs_app_bar.dart';
import '../../data/models/job_model.dart';
import '../cubit/jobs_cubit.dart';
import 'widgets/empty_state_widget.dart';
import 'widgets/error_state_widget.dart';
import 'widgets/job_card.dart';
import 'widgets/job_shimmer.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JobsCubit>().loadJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const JobsAppBar(title: 'Jobs'),
      body: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) {
          switch (state) {
            case JobsInitialState():
              return const SizedBox();
            case JobsLoadingState():
              return const JobShimmer();
            case JobsLoadedState():
              return state.jobs.isEmpty
                  ? const EmptyStateWidget()
                  : JobsList(jobs: state.jobs);
            case JobsFailureState():
              return const ErrorStateWidget();
          }
        },
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  const JobsList({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: jobs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemBuilder: (context, index) {
        return JobCard(job: jobs[index]);
      },
    );
  }
}
