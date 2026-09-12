part of 'jobs_cubit.dart';

sealed class JobsState {}

final class JobsInitialState extends JobsState {}

final class JobsLoadingState extends JobsState {}

final class JobsLoadedState extends JobsState {
  final List<Job> jobs;

  JobsLoadedState({required this.jobs});
}

final class JobsFailureState extends JobsState {
  final String errorMessage;

  JobsFailureState({required this.errorMessage});
}
