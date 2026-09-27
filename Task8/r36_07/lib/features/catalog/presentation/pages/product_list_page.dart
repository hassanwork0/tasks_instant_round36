import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/list_shimmer.dart';
import '../../data/models/product_summary_model.dart';
import '../../domain/repositories/product_list_repository.dart';
import '../../../product_details/presentation/pages/product_details_page.dart';
import '../cubit/product_list_cubit.dart';
import '../cubit/product_list_state.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocProvider(
        create: (context) =>
            ProductListCubit(context.read<ProductListRepository>())
              ..fetchProducts(),
        child: const _ProductListView(),
      ),
    );
  }
}

class _ProductListView extends StatelessWidget {
  const _ProductListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        return switch (state) {
          ProductListInitial() => const Center(
            child: CircularProgressIndicator(),
          ),
          ProductListLoading() => const ListShimmer(),
          ProductListLoaded() => _buildProducts(context, state.products),
          ProductListFailure() => EmptyState(
            icon: Icons.cloud_off_outlined,
            message: state.message,
            onRetry: () => context.read<ProductListCubit>().fetchProducts(),
          ),
        };
      },
    );
  }

  Widget _buildProducts(
    BuildContext context,
    List<ProductSummaryModel> products,
  ) {
    if (products.isEmpty) {
      return const EmptyState(
        icon: Icons.inbox_outlined,
        message: 'No products available',
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ProductListCubit>().fetchProducts(),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: products.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                settings: RouteSettings(arguments: product.id),
                builder: (_) => const ProductDetailsPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
