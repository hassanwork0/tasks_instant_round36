import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/jobs/data/datasources/job_remote_data_source.dart';
import 'features/jobs/data/repository/job_repository_impl.dart';
import 'features/jobs/presentation/cubit/jobs_cubit.dart';
import 'features/jobs/presentation/screens/jobs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: BlocProvider(
        create: (_) => JobsCubit(
          repository: JobRepositoryImpl(
            remoteDataSource: JobRemoteDataSource(),
          ),
        ),
        child: const JobsScreen(),
      ),
    );
  }
}
