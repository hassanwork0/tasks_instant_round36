import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/products_model.dart';
import '../cubit/products_cubit.dart';
import '../widgets/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Products'))),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitialState():
              return SizedBox();
            case ProductsLoadingState():
              return const ProductShimmer();
            case ProductsLoadedState():
              return state.products.isEmpty
                  ? const ProductsEmpty()
                  : ProductsList(productsList: state.products);
            case ProductsFailureState():
              return const ProductsFailure();
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
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 450,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}

class ProductsList extends StatelessWidget {
  final List<Products> productsList;

  const ProductsList({super.key, required this.productsList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
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
          const Icon(Icons.data_array, size: 88),
          const Text('No products found!', style: TextStyle(fontSize: 22)),
        ],
      ),
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
          const Icon(Icons.error, size: 88),
          Text(
            (context.read<ProductsCubit>().state as ProductsFailureState)
                .errorMessage,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}