import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_5/core/routes.dart';
import 'package:task_5/features/products/presentation/cubit/products_cubit.dart';
import 'package:task_5/features/products/presentation/product_screen.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: Routes.productsScreen,
    routes: [
      GoRoute(
        path: Routes.productsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductsCubit(),
          child: const ProductsScreen(),
        ),
      ),
    ],
  );
}