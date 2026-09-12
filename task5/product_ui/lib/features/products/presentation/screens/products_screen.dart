import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/product.dart';
import '../cubit/products_cubit.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black87, size: 28),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitialState():
              return const SizedBox();
            case ProductsLoadingState():
              return const ProductShimmer();
            case ProductsLoadedState():
              return state.products.isEmpty
                  ? const ProductsEmpty()
                  : ProductsList(products: state.products);
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
      padding: const EdgeInsets.only(top: 8),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 450,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        );
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
          Text('No prodcuts found!', style: TextStyle(fontSize: 22)),
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
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(product: product);
      },
    );
  }
}
