import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/jobs_model.dart';
import '../../data/repo/jobs_repo.dart';
part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobsRepo _jobsRepo;

  JobCubit(JobsRepo jobsRepo) : _jobsRepo = jobsRepo, super(JobInitialState());

  Future<void> getJobs() async {
    emit(JobLoadingState());

    await Future.delayed(const Duration(milliseconds: 3000));

    final int jobsCase = Random().nextInt(3);

    final jobsModel = await _jobsRepo.getJob();

    if (jobsCase == 0) {
      emit(JobFailureState());
    }

    if (jobsCase == 1) {
      emit(JobLoadedState(dataList: []));
    }

    if (jobsCase == 2) {
      emit(JobLoadedState(dataList: jobsModel.data!));
    }
  }

  Future<void> openJobUrl(String url) async {
    final currentState = state;

    if (currentState is! JobLoadedState) return;

    emit(JobLoadingUrl(dataList: currentState.dataList));

    await Future.delayed(Duration(seconds: 2));

    try {
      final uri = Uri.parse(url);

      final launched = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);

      if (launched) {
        emit(JobLoadedUrl(dataList: currentState.dataList));
      } else {
        emit(JobFailureUrl(dataList: currentState.dataList));
      }
    } catch (e) {
      emit(JobFailureUrl(dataList: currentState.dataList));
    }
  }
}
