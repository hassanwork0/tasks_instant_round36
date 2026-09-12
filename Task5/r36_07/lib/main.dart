import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/products/presentation/screens/products_screen.dart';

void main() {
  runApp(Task5App());
}

class Task5App extends StatelessWidget {
  Task5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => ProductsCubit(),
        child: ProductsScreen(),
      ),
    );
  }
}
