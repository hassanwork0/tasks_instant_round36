import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widgets/product_shimmer.dart';
import '../widgets/products_empty.dart';
import '../widgets/products_failure.dart';
import '../widgets/products_list.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return ProductShimmer();
          }
          if (state is ProductsLoadedState) {
            return state.products.isEmpty
                ? ProductsEmpty()
                : ProductsList(products: state.products);
          }
          if (state is ProductsFailureState) {
            return ProductsFailure();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
