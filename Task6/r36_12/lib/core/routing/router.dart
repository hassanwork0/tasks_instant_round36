import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_app/core/api/dio_factory.dart';
import 'package:job_app/core/routing/routes.dart';
import 'package:job_app/features/job/data/data_sources/remote_data_source.dart';
import 'package:job_app/features/job/data/repo/jobs_repo.dart';
import '../../features/job/data/models/jobs_model.dart';
import '../../features/job/presentation/cubit/job_cubit.dart';
import '../../features/job/presentation/screens/job_screen.dart';
import '../../features/job_details/presentation/screens/job_details_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.job,
    routes: [
      GoRoute(
        path: Routes.job,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                JobCubit(JobsRepo(RemoteDataSource(DioFactory.getDio())))
                  ..getJobs(),
            child: JobScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.jobDetails,
        builder: (context, state) {
          final jobs = state.extra as Data;
          return JobDetailsScreen(data: jobs);
        },
      ),
    ],
  );
}
