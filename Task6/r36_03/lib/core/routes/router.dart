import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_6/features/jobs/data/data_sources/job_remote_data_source.dart';
import 'package:task_6/features/jobs/data/repo/job_repository.dart';
import 'package:task_6/features/jobs/presentation/cubit/jobs_cubit.dart';
import 'package:task_6/features/jobs/presentation/pages/jobs_screen.dart';

import '../api/dio_factory.dart';

import 'routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.jobsScreen,
  routes: [
    GoRoute(
      path: Routes.jobsScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => JobsCubit(
          JobRepositoryImpl(
            jobRemoteDataSource: JobRemoteDataSource(dio: DioFactory.getDio()),
          ),
        )..fetchJobs(),
        child: const JobsScreen(),
      ),
    ),
  ],
);
