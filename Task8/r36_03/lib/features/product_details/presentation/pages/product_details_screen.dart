import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product_details_model.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
import '../widgets/details_error_widget.dart';
import '../widgets/details_shimmer.dart';
import '../widgets/product_image_carousel.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({super.key, this.productId = 1});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'), centerTitle: true),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailsInitialState() ||
            ProductDetailsLoadingState() => const DetailsShimmer(),
            ProductDetailsFailureState(:final errorMessage) =>
              DetailsErrorWidget(
                errorMessage: errorMessage,
                onRetry: () => context
                    .read<ProductDetailsCubit>()
                    .fetchProductDetails(widget.productId),
              ),
            ProductDetailsLoadedState(:final product) => _buildProductContent(
              context,
              product,
              colorScheme,
            ),
          };
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is! ProductDetailsLoadedState) {
                return const SizedBox.shrink();
              }
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart_rounded),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: const StadiumBorder(),
                      minimumSize: const Size.fromHeight(56),
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }

  Widget _buildProductContent(
    BuildContext context,
    ProductDetailsModel product,
    ColorScheme colorScheme,
  ) {
    final allImages = product.images.isNotEmpty
        ? product.images
        : (product.thumbnail.isNotEmpty ? [product.thumbnail] : <String>[]);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageCarousel(images: allImages),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(product.category.toUpperCase()),
                backgroundColor: colorScheme.secondaryContainer,
                labelStyle: TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                shape: const StadiumBorder(),
                side: BorderSide.none,
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 22),
                  const SizedBox(width: 4),
                  Text(
                    '${product.rating}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Brand: ${product.brand}',
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (product.discountPercentage > 0) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '-${product.discountPercentage}%',
                    style: TextStyle(
                      color: colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0,
            color: colorScheme.surfaceContainerLow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
