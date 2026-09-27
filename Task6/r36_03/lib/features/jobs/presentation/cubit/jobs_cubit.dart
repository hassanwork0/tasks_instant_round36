import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/jobs/data/models/job_model.dart';
import 'package:task_6/features/jobs/data/repo/job_repository.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final JobRepository jobRepository;
  JobsCubit(this.jobRepository) : super(JobsInitialState());

  Future<void> fetchJobs() async {
    emit(JobsLoadingState());
    try {
      final List<JobModel> jobs = await jobRepository.fetchJobs();
      emit(JobsLoadedState(jobs: jobs));
    } catch (e) {
      emit(JobsErrorState(message: e.toString()));
    }
  }
}
