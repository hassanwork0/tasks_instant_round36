import 'package:flutter/material.dart';

import '../../data/models/products_model.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Image.network(
                      product.images.first,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              //favorite, discount
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //favorite
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                      ),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    //discount
                    if (product.hasDiscount)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${product.discountPercentageInt}% OFF",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          //category, title, rating, price, btn add to cart
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //category
                Text(
                  product.category,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),

                const SizedBox(height: 6),

                //title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),

                const SizedBox(height: 8),

                //rating
                Row(
                  children: [
                    Text(
                      "(${product.reviews?.length})",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "(${product.rating})",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                  ],
                ),

                const SizedBox(height: 10),

                //price
                Row(
                  children: [
                    if (product.hasDiscount)
                      Text(
                        "\$${product.originalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    if (product.hasDiscount) const SizedBox(width: 8),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // btn add to cart
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text("Add to Cart"),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
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
