part of 'job_cubit.dart';

sealed class JobState {}

final class JobInitialState extends JobState {}

final class JobLoadingState extends JobState {}

final class JobLoadedState extends JobState {
  final List<Data> dataList;
  JobLoadedState({required this.dataList});
}

final class JobFailureState extends JobState {}

final class JobLoadingUrl extends JobLoadedState {
  JobLoadingUrl({required super.dataList});
}

final class JobLoadedUrl extends JobLoadedState {
  JobLoadedUrl({required super.dataList});
}

final class JobFailureUrl extends JobLoadedState {
  JobFailureUrl({required super.dataList});
}
