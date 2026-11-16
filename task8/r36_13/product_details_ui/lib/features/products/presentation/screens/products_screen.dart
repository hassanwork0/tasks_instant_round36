import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_details_ui/core/routing/routes.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import 'package:product_details_ui/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_details_ui/features/products/presentation/widgets/product_item.dart';

import 'package:shimmer/shimmer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void initState() {
    super.initState();

    context.read<ProductsCubit>().loadFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(Routes.searchProducts);
            },
            icon:  Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitialState():
              return SizedBox();

            case ProductsLoadingState():
              return ProductShimmer();

            case ProductsEmptyState():
              return ProductsEmpty();

            case ProductsSuccessState():
              return productsList(
                products: state.products,
                isLoadingMore: state.isLoadingMore,
              );

            case ProductsFaliureState():
              return ProductsFailure();
          }
        },
      ),
    );
  }
}

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              height: 450,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProductsFailure extends StatelessWidget {
  const ProductsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, size: 88),
          Text(
            (context.read<ProductsCubit>().state as ProductsFaliureState)
                .message,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

class productsList extends StatefulWidget {
  const productsList({
    super.key,
    required this.products,
    required this.isLoadingMore,
  });

  final List<Products> products;
  final bool isLoadingMore;

  @override
  State<productsList> createState() => _productsListState();
}

class _productsListState extends State<productsList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final nearBottom =
        _controller.position.pixels >=
        _controller.position.maxScrollExtent - 300;
    if (nearBottom) context.read<ProductsCubit>().loadNextPage();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.products.length + (widget.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= widget.products.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final product = widget.products[index];
        return ProductItem(product: product);
      },
    );
  }
}

class ProductsEmpty extends StatelessWidget {
  const ProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.data_array, size: 88),
          Text("no products found", style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
