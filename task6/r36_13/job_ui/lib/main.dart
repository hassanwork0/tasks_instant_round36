import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_ui/core/api/dio_factory.dart';
import 'package:job_ui/features/job/data/remote_datasource/remote_data_source.dart';
import 'package:job_ui/features/job/data/repo/repo.dart';
import 'package:job_ui/features/job/presentation/bloc/job_cubit.dart';
import 'package:job_ui/features/job/presentation/pages/home_screen.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "job list ",
      home: BlocProvider(
        create: (context) =>
            JobCubit(JobsRepo(RemoteDataSource(DioFactory.getDio())))
              ..getJobs(),
        child: const HomeScreen(),
      ),
    );
  }
}
