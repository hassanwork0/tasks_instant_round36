import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_list_screen/features/home/home_screen.dart';
import 'package:product_list_screen/features/login/presentation/cubit/login_cubit.dart';
import 'package:product_list_screen/features/login/presentation/screens/login_screen.dart';
import 'package:product_list_screen/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_list_screen/features/products/presentation/screens/products_screen.dart';

class AppRouter {
  AppRouter();
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginScreen(),
        ),
      ),

      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      
      GoRoute(
        path: '/products',
        builder: (context, state) => BlocProvider(
          create: (context) => ProductsCubit(),
          child: const ProductScreen(),
        ),
      ),
    ],
  );
}
