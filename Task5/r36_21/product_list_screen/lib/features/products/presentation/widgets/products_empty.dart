import 'package:flutter/material.dart';

class ProductsEmpty extends StatelessWidget {
  const ProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.data_array, size: 88),
          const Text('No prodcuts found!', style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}