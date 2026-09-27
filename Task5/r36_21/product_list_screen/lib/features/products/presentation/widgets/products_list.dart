import 'package:flutter/material.dart';
import 'package:product_list_screen/features/products/data/dummy_data.dart' as dummy_data;
import 'package:product_list_screen/features/products/data/product.dart';
import 'package:product_list_screen/features/products/presentation/widgets/products_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key, required List<Product> products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: dummy_data.products.length,
        itemBuilder: (context, index) {
          final product = dummy_data.products[index];
          return ProductsCard(product: product);
        },
      ),
    );
  }
}