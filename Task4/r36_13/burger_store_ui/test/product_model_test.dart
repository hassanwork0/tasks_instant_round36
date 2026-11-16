import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses the catalog and serializes product fields', () {
    final catalog = ProductModel.fromJson({
      'categoryButtons': ['All', 'Beef'],
      'products': [
        {
          'id': 1,
          'name': 'Cheeseburger',
          'brand': "Wendy's Burger",
          'rating': 4.9,
          'deliveryTime': 26,
          'price': 8.24,
          'imagePath': 'https://example.com/cheeseburger.png',
          'category': 'Beef',
          'description': 'A classic cheeseburger.',
        },
      ],
    });

    final product = catalog.products.single;
    expect(catalog.categoryButtons, ['All', 'Beef']);
    expect(product.rating, 4.9);
    expect(product.price, 8.24);
    expect(product.imagePath, 'https://example.com/cheeseburger.png');
    expect(catalog.toJson()['products'], [product.toJson()]);
  });
}
