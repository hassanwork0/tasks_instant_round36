import 'package:flutter/material.dart';

class ProductsEmpty extends StatelessWidget {
  ProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 72, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'No prodcuts found!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
