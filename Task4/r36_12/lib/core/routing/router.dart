import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../features/food/presentation/cubit/food_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';
import '../../features/signup/presentation/screens/sign_up_screen.dart';
import '../data/food_model.dart';
import '../../features/food/presentation/screens/food_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(),
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) =>
            BlocProvider(create: (context) => HomeCubit(), child: HomeScreen()),
      ),
      GoRoute(
        path: Routes.food,
        builder: (context, state) {
          final product = state.extra as Products;
          return BlocProvider(
            create: (context) => FoodCubit(originalPrice: product.price ?? 0),
            child: FoodScreen(product: product),
          );
        },
      ),
    ],
  );
}
