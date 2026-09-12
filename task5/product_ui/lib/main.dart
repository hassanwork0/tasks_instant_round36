import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/products/presentation/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductsCubit(),
        child: ProductsScreen(),
      ),
    );
  }
}