import 'package:burger_store_ui/core/routes/routes.dart';
import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:burger_store_ui/features/food/presentation/pages/home.dart';
import 'package:burger_store_ui/features/food_details/presentation/bloc/price_cubit.dart';
import 'package:burger_store_ui/features/food_details/presentation/pages/product_screen.dart';
import 'package:burger_store_ui/features/login%20&%20register/presentation/pages/login.dart';
import 'package:burger_store_ui/features/login%20&%20register/presentation/pages/register.dart';
import 'package:burger_store_ui/features/splash/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => Splash()),

    GoRoute(path: Routes.home, builder: (context, state) => Home()),

    GoRoute(
      path: Routes.product,
      builder: (context, state) {
        final product = state.extra as Product?;

        if (product == null) {
          return const Scaffold(body: Center(child: Text('Product not found')));
        }

        return BlocProvider(
          create: (context) => PriceCubit(product),
          child: ProductScreen(product: product),
        );
      },
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) => loginScreen(email: TextEditingController() , password: TextEditingController() ),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => registerScreen(email: TextEditingController() , password: TextEditingController() , name : TextEditingController() ),
    ),
  ],
);
