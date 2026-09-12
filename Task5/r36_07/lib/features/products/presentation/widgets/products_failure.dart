import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/products_cubit.dart';

class ProductsFailure extends StatelessWidget {
  ProductsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 72, color: Colors.red),
          SizedBox(height: 12),
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => context.read<ProductsCubit>().getProducts(),
            icon: Icon(Icons.refresh),
            label: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
