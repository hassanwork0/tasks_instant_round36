import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:product_details_ui/core/routing/routes.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import 'package:product_details_ui/features/products/presentation/widgets/product_item.dart';

void main() {
  testWidgets('tapping a product opens its details route', (
    WidgetTester tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              Scaffold(body: ProductItem(product: Products(id: 42))),
        ),
        GoRoute(
          path: Routes.productsDetail,
          builder: (context, state) => Scaffold(
            body: Text(state.pathParameters['productId'] ?? 'missing'),
          ),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.tap(find.byType(ProductItem));
    await tester.pumpAndSettle();

    expect(find.text('42'), findsOneWidget);
  });
}
