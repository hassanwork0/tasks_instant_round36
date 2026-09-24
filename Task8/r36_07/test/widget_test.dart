import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipes_app/features/catalog/presentation/pages/product_list_page.dart';
import 'package:recipes_app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:recipes_app/main.dart';

void main() {
  testWidgets('App renders the product list page', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipesApp());
    await tester.pump();

    expect(find.text('Products'), findsOneWidget);
  });

  testWidgets('ProductDetailsPage builds without ProviderNotFoundException', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipesApp());
    await tester.pump();

    final BuildContext context = tester.element(find.byType(ProductListPage));
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(arguments: 1),
        builder: (_) => const ProductDetailsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Product Details'), findsOneWidget);
  });
}
