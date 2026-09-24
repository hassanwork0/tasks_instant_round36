import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injector.dart';
import 'features/catalog/domain/repositories/product_list_repository.dart';
import 'features/catalog/presentation/pages/product_list_page.dart';
import 'features/product_details/domain/repositories/product_details_repository.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductListRepository>(
          create: (_) => Injector.productListRepository,
        ),
        RepositoryProvider<ProductDetailsRepository>(
          create: (_) => Injector.productDetailsRepository,
        ),
      ],
      child: MaterialApp(
        title: 'Recipes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductListPage(),
      ),
    );
  }
}
