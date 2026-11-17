import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import 'package:product_details_ui/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_details_ui/features/products/presentation/widgets/product_item.dart';
import 'package:product_details_ui/features/search_products/presentation/cubit/search_products_cubit.dart';

import 'package:shimmer/shimmer.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});
  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  final TextEditingController _searchcontoller = TextEditingController();
  late final SearchProductsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SearchProductsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            _searchcontoller.clear();
            context.pop();
          },
        ),
        title: TextField(
          controller: _searchcontoller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Search.....',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
          onChanged: (query) {
            cubit.onQueryChanged(query);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchcontoller.clear();
              cubit.onQueryChanged(_searchcontoller.text);
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchProductsCubit, SearchProductsState>(
        builder: (context, state) {
          switch (state) {
            case SearchProductsInitialState():
              return SizedBox();

            case SearchProductsLoadingState():
              return ProductShimmer();

            case SearchProductsEmptyState():
              return ProductsEmpty();

            case SearchProductsSuccessState():
              return productsList(
                products: state.products,
                isLoadingMore: state.isLoadingMore,
              );

            case SearchProductsFaliureState():
              return ProductsFailure();
          }
          // return Scaffold(
          //   appBar: AppBar(title: Text('Products Screen')),
          //   body: ListView.builder(
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return ProductItem(product: product);
          //     },
          //   ),
          // );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchcontoller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
