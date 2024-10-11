// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getAppGroupDirectory test', (WidgetTester tester) async {
    expect(find.byKey(const ValueKey('appGroupPath')), findsNothing);

    final getAppGroupButton = find.byKey(const Key('getAppGroupButton'));
    await tester.ensureVisible(getAppGroupButton);
    await tester.tap(getAppGroupButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('appGroupPath')), findsOneWidget);
  });
}
