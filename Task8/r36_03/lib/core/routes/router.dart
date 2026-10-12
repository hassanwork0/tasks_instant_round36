import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task8/core/routes/routes.dart';
import 'package:task8/features/product_details/data/repo/product_details_repository_impl.dart';
import 'package:task8/features/product_details/data/source/product_details_source.dart';
import 'package:task8/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:task8/features/product_details/presentation/pages/product_details_screen.dart';

final appRouter = GoRouter(
  initialLocation: Routes.productDetails,
  routes: [
    GoRoute(
      path: Routes.productDetails,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ProductDetailsCubit(
            ProductDetailsRepositoryImpl(ProductDetailsSource()),
          ),
          child: const ProductDetailsPage(productId: 1),
        );
      },
    ),
  ],
);
