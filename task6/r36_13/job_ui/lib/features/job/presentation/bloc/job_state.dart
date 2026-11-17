import 'package:job_ui/features/job/data/model/job_model.dart';

sealed class JobState {}

final class JobInitialState extends JobState {}

final class JobLoadingState extends JobState {}

final class JobLoadedState extends JobState {
  final List<JobModel> jobs;

  JobLoadedState({required this.jobs});
}

final class JobFailureState extends JobState {
  final String errorMessage;

  JobFailureState({required this.errorMessage});
}
