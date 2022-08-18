import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_flutter/main.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sleepSec(int sec) => sleep(Duration(seconds: sec));

  testWidgets('Testing home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

  expect(find.text('0'), findsOneWidget);
  expect(find.text('1'), findsNothing);

  await tester.tap(find.byTooltip('Increment'));
  await tester.pumpAndSettle();

  sleepSec(4);

  expect(find.text('1'), findsOneWidget);
  expect(find.text('0'), findsNothing);

  sleepSec(1);

  await tester.enterText(find.byKey(const Key('text_field_login')), 'julia.warren@gmail.com');

  await tester.pumpAndSettle();
  sleepSec(1);

  await tester.enterText(find.byKey(const Key('text_field_password')), 'jujubaa');

  await tester.pumpAndSettle();
  sleepSec(1);

  });
}