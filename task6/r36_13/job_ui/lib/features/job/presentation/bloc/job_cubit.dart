import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_ui/features/job/data/repo/repo.dart';
import 'package:job_ui/features/job/presentation/bloc/job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobsRepo _jobsRepo;

  JobCubit(JobsRepo jobsRepo) : _jobsRepo = jobsRepo, super(JobInitialState());

  Future<void> getJobs() async {
    emit(JobLoadingState());

    final int Cases = Random().nextInt(3);
   
    try {
      final model = await _jobsRepo.getJob();

      if (Cases == 0) {
        emit(JobFailureState(errorMessage: 'Unable to load jobs.'));
      }

      if (Cases == 1) {
        emit(JobLoadedState(jobs: []));
      }

      if (Cases == 2) {
        emit(JobLoadedState(jobs: model));
      }
    } on DioException catch (error) {
      emit(
        JobFailureState(errorMessage: error.message ?? 'Unable to load jobs.'),
      );
    } on FormatException catch (error) {
      emit(JobFailureState(errorMessage: 'Invalid jobs response: $error'));
    } on TypeError catch (error) {
      emit(JobFailureState(errorMessage: 'Invalid jobs response: $error'));
    }
  }
}
