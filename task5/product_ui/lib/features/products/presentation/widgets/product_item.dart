import 'package:flutter/material.dart';
import '../../data/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  Color navy = Color(0xFF2B2A4C);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              if (!product.isAvailable)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Text(
                      'غير متوفر',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: () => setState(() => isFavorite = !isFavorite),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.redAccent : Colors.black87,
                      size: 19,
                    ),
                  ),
                ),
              ),
              if (product.hasDiscount)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Text(
                      'خصم %${product.discountPercentageText}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.category,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
                SizedBox(height: 6),
                Text(
                  product.name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '(${product.reviewsCount})',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (product.hasDiscount) ...[
                      Text(
                        product.oldPrice!.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                    Text(
                      '${product.price.toStringAsFixed(0)} ج.م',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: OutlinedButton(
                    onPressed: product.isAvailable
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('تمت الاضافة: ${product.name}'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        : null,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'اضف للسلة',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: product.isAvailable
                                ? navy
                                : Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                          color: product.isAvailable
                              ? navy
                              : Colors.grey.shade400,
                        ),
                      ],
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
