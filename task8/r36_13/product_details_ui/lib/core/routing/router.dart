import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:product_details_ui/core/api/dio_factory.dart';
import 'package:product_details_ui/core/routing/routes.dart';
import 'package:product_details_ui/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:product_details_ui/features/products/data/repo/products_repo.dart';
import 'package:product_details_ui/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_details_ui/features/products/presentation/screens/products_screen.dart';
import 'package:product_details_ui/features/products_details/data/data_sources/products_details_remote_data_source.dart';
import 'package:product_details_ui/features/products_details/data/repo/product_details_repo.dart';
import 'package:product_details_ui/features/products_details/presentation/cubit/product_details_cubit.dart';
import 'package:product_details_ui/features/products_details/presentation/screens/product_details_screen.dart';
import 'package:product_details_ui/features/search_products/data/data_sources/search_product_remote_data_source.dart';
import 'package:product_details_ui/features/search_products/data/repo/search_products_repo.dart';
import 'package:product_details_ui/features/search_products/presentation/cubit/search_products_cubit.dart';
import 'package:product_details_ui/features/search_products/presentation/screens/search_products_screen.dart';

final router = GoRouter(
  initialLocation: Routes.products,
  routes: [
    GoRoute(
      path: Routes.products,
      builder: (context, state) => BlocProvider(
        create: (context) => ProductsCubit(
          ProductsRepo(ProductsRemoteDataSource(DioFactory.getDio())),
        ),
        child: ProductsScreen(),
      ),
    ),
    GoRoute(
      path: Routes.searchProducts,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchProductsCubit(
          SearchProductsRepo(
            SearchProductsRemoteDataSource(DioFactory.getDio()),
          ),
        ),
        child: SearchProductsScreen(),
      ),
    ),
    GoRoute(
      path: Routes.productsDetail,
      builder: (context, state) {
        final productId = int.tryParse(state.pathParameters['productId'] ?? '');
        if (productId == null) {
          return const Scaffold(
            body: Center(child: Text('Invalid product ID')),
          );
        }

        return BlocProvider(
          create: (context) => ProductDetailsCubit(
            ProductDetailsRepo(
              ProductsDetailsRemoteDataSource(DioFactory.getDio()),
            ),
          ),
          child: ProductDetailsScreen(productId: productId),
        );
      },
    ),
  ],
);
