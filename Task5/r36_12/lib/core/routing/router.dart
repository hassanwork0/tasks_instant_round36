import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products/core/api/dio_factory.dart';
import 'package:task_products/core/routing/routes.dart';
import 'package:task_products/features/products/data/data_sources/local_data_source.dart';
import 'package:task_products/features/products/data/data_sources/remote_data_source.dart';
import 'package:task_products/features/products/data/repo/products_repo.dart';
import 'package:task_products/features/products/presentation/cubit/products_cubit.dart';
import 'package:task_products/features/products/presentation/screens/product_screen.dart';

class AppRouter {
  static GoRouter router(SharedPreferences sharedPreferences) {
    return GoRouter(
      initialLocation: Routes.product,
      routes: [
        GoRoute(
          path: Routes.product,
          builder: (context, state) => BlocProvider(
            create: (context) => ProductsCubit(
              ProductsRepo(
                RemoteDataSource(DioFactory.getDio()),
                LocalDataSource(sharedPreferences),
              ),
            )..getProducts(),
            child: const ProductScreen(),
          ),
        ),
      ],
    );
  }
}
