import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products/core/api/dio_factory.dart';
import 'package:task_products/core/routing/routes.dart';
import 'package:task_products/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:task_products/features/cart/data/repo/cart_repo.dart';
import 'package:task_products/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:task_products/features/products/data/data_sources/local_data_source.dart';
import 'package:task_products/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:task_products/features/products/data/repo/products_repo.dart';
import 'package:task_products/features/products/presentation/cubit/products_cubit.dart';
import 'package:task_products/features/products/presentation/screens/product_screen.dart';
import 'package:task_products/features/products_details/data/data_sources/products_details_remote_data_source.dart';
import 'package:task_products/features/products_details/data/repo/products_details_repo.dart';
import 'package:task_products/features/products_details/presentation/cubit/products_details_cubit.dart';
import 'package:task_products/features/products_details/presentation/screens/products_details_screen.dart';
import 'package:task_products/features/search_products/data/data_sources/search_remote_data_source.dart';
import 'package:task_products/features/search_products/presentation/cubit/search_products_cubit.dart';
import 'package:task_products/features/search_products/presentation/screens/search_products_screen.dart';

import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/products/data/models/products_model.dart';
import '../../features/search_products/data/repo/search_products_repo.dart';

class AppRouter {
  static GoRouter router(SharedPreferences sharedPreferences) {
    return GoRouter(
      initialLocation: Routes.product,
      routes: [
        // ShellRoute wraps all sub-routes with persistent providers
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (context) => CartCubit(
                CartRepo(CartRemoteDataSource(DioFactory.getDio())),
              ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: Routes.product,
              builder: (context, state) => BlocProvider(
                create: (context) => ProductsCubit(
                  ProductsRepo(
                    ProductsRemoteDataSource(DioFactory.getDio()),
                    LocalDataSource(sharedPreferences),
                  ),
                ),
                child: const ProductScreen(),
              ),
            ),
            GoRoute(
              path: Routes.productDetails,
              builder: (context, state) {
                final product = state.extra as Products;
                return BlocProvider(
                  create: (context) => ProductsDetailsCubit(
                    ProductsDetailsRepo(
                      ProductsDetailsRemoteDataSource(DioFactory.getDio()),
                    ),
                  ),
                  child: ProductsDetailsScreen(
                    productId: product.id,
                    product: product,
                  ),
                );
              },
            ),
            GoRoute(
              path: Routes.searchProduct,
              builder: (context, state) => BlocProvider(
                create: (context) => SearchProductsCubit(
                  SearchProductsRepo(
                    SearchRemoteDataSource(DioFactory.getDio()),
                  ),
                ),
                child: const SearchProductsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.cart,
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
