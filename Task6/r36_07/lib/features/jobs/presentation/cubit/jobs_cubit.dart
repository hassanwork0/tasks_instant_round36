import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/job_model.dart';
import '../../data/repository/job_repository.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final JobRepository _repository;

  JobsCubit({required this._repository}) : super(JobsInitialState());


  Future<void> loadJobs() async {
    emit(JobsLoadingState());

    try {
      final jobs = await _repository.getJobs();
      if (jobs.isEmpty) {
        emit(JobsLoadedState(jobs: []));
      } else {
        emit(JobsLoadedState(jobs: jobs));
      }
    } catch (_) {
      emit(JobsFailureState(
        errorMessage: 'Failed to load jobs. Check your internet connection.',
      ));
    }
  }
}
