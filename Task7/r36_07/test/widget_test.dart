import 'package:flutter_test/flutter_test.dart';

import 'package:recipes_app/main.dart';

void main() {
  testWidgets('App builds and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipesApp());

    expect(find.text('Recipes App'), findsOneWidget);
  });
}
