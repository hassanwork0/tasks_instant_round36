// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../data/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  product.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (product.hasDiscount)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'خصم ${product.discountPercentageText}%',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              Positioned(
                top: 12,
                left: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: const Icon(Icons.favorite_border, color: Colors.black54),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.category,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('(${product.reviewsCount})', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 4),
                    Text('${product.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (product.hasDiscount) ...[
                      Text(
                        '${product.oldPrice!.toInt()}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      '${product.price.toInt()} ج.م',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.deepPurple),
                  label: const Text('اضف للسلة', style: TextStyle(color: Colors.deepPurple)),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}