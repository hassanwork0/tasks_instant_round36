import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_4_stages/features/products/data/dummy_data.dart';
import 'package:product_list_4_stages/features/products/data/product.dart';
import 'package:product_list_4_stages/features/products/presentation/cubit/products_cubit.dart';
import 'package:product_list_4_stages/features/products/presentation/widgets/product_item.dart';
import 'package:shimmer/shimmer.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        switch (state) {
          case ProductsInitialState():
            return SizedBox();

          case ProductsLoadingState():
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200,
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

          case ProductsLoadedState():
            return state.products.isEmpty
                ? ProductsEmpty()
                : productsList(Products: state.products);

          case ProductFailureState():
            return ProductsFailure();
        }
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
            (context.read<ProductsCubit>().state as ProductFailureState)
                .errorMessage,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

class productsList extends StatelessWidget {
  const productsList({super.key, required this.Products});

  final List<Product> Products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
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
