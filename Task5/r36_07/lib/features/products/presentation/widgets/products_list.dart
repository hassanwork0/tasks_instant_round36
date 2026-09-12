import 'package:flutter/material.dart';

import '../../data/product.dart';
import '../screens/adaptive.dart';
import 'product_item.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: Adaptive.screenPadding(context),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Adaptive.itemSpacing(context)),
          child: ProductItem(product: products[index]),
        );
      },
    );
  }
}
