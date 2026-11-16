import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_4_stages/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_list_4_stages/features/products/presentation/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: MaterialApp(title: 'My App', home: ProductsScreen()),
    );
  }
}
