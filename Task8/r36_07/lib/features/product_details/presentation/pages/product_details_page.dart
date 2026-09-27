import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../domain/repositories/product_details_repository.dart';

import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
import '../widgets/details_shimmer.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context)?.settings.arguments;
    final productId = int.tryParse('$settings') ?? 1;

    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit(context.read<ProductDetailsRepository>())
            ..fetchProductDetails(productId),
      child: _ProductDetailsView(productId: productId),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView({required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Product Details')),
          body: switch (state) {
            ProductDetailsInitial() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProductDetailsLoading() => const DetailsShimmer(),
            ProductDetailsLoaded() => ProductDetailsBody(
              product: state.product,
            ),
            ProductDetailsFailure() => EmptyState(
              icon: Icons.cloud_off_outlined,
              message: state.message,
              onRetry: () => context
                  .read<ProductDetailsCubit>()
                  .fetchProductDetails(productId),
            ),
          },
          bottomNavigationBar: state is ProductDetailsLoaded
              ? _AddToCartBar(
                  title: state.product.title,
                  price: state.product.discountedPrice,
                )
              : null,
        );
      },
    );
  }
}

class _AddToCartBar extends StatelessWidget {
  const _AddToCartBar({required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: FilledButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  '$title added to cart · \$${price.toStringAsFixed(2)}',
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
        },
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: const Icon(Icons.shopping_cart_outlined),
        label: const Text(
          'Add to Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
