import 'package:flutter_test/flutter_test.dart';

import 'package:task5/main.dart';

void main() {
  testWidgets('renders the products screen', (WidgetTester tester) async {
    await tester.pumpWidget(Task5App());
    await tester.pump(Duration(seconds: 2));

    expect(find.text('Products'), findsOneWidget);
  });
}
