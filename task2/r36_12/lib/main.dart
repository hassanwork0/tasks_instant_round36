import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/basketball/presentation/cubit/counter_cubit.dart';
import 'features/basketball/presentation/screens/basketball_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basketball App",
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: BasketballScreen(),
      ),
    );
  }

}
