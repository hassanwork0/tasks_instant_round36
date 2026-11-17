import 'package:basketball_score_counter/presentation/cubit/counter_cubit.dart';
import 'package:basketball_score_counter/presentation/pages/basketball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterCubit(),
      child: MaterialApp(home: Basketball()),
    );
  }
}
