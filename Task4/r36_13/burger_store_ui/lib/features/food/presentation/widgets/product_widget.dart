import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 4,
        children: [
          Image(
            image: NetworkImage(product.imagePath),
            width: 100,
            height: 100,
          ),
          Text(
            product.brand,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(product.name, style: TextStyle(color: Colors.black)),
          Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.star), Text("${product.rating}/5")]),
              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
