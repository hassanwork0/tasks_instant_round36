import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return ColoredBox(
                  color: theme.colorScheme.surfaceContainerHighest,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return ColoredBox(
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.image_not_supported_outlined),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  product.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (product.hasDiscount) ...[
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          '\$${product.oldPrice!.toStringAsFixed(2)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            decoration: TextDecoration.lineThrough,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                    if (product.hasDiscount) ...[
                      SizedBox(width: 8),
                      _DiscountBadge(percentage: product.discountPercentage),
                    ],
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 18, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  final int percentage;

  _DiscountBadge({required this.percentage});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '-$percentage%',
        style: TextStyle(
          color: scheme.onErrorContainer,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
