import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mixed_flutter/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Performance Test",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Page 1
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pump();
      expect(find.text('3'), findsOneWidget);

      await tester.drag(
        find.text('Panel Text'),
        Offset(0, -300),
      );
      await tester.pumpAndSettle();
      await tester.drag(
        find.text('Panel Text'),
        Offset(0, 300),
      );
      await tester.pumpAndSettle();

      // Page 2
      await tester.tap(
        find.byType(TextButton),
      );

      await tester.pumpAndSettle();

      // Page 3
      await tester.tap(
        find.text('To Third Page'),
      );
      await tester.pumpAndSettle();
      final itemFinder = find.byKey(Key('Item 123'));
      await tester.scrollUntilVisible(itemFinder, 200);
      await tester.pumpAndSettle();
      expect(find.text('Item 123'), findsOneWidget);

      // Back to Page 2
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pumpAndSettle();

      // Back to Page 1
      await tester.tap(
        find.text('Back'),
      );
      await tester.pumpAndSettle();
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pump();
      expect(find.text('4'), findsOneWidget);
    },
  );
}
