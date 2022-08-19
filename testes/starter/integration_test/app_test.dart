import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ideast/main.dart';
import 'package:ideast/screens/home_screen.dart';
import 'package:integration_test/integration_test.dart';

void sleepSec(int seconds) => sleep(Duration(seconds: seconds));

Future login(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();

  await tester.enterText(
    find.byKey(const Key('emailLoginField')),
    'julia@julia',
  );
  // await tester.pump();
  sleepSec(2);

  await tester.enterText(
    find.byKey(const Key('passwordLoginField')),
    'jujujuju',
  );

  sleepSec(2);
  await tester.testTextInput.receiveAction(TextInputAction.done);
  sleepSec(1);

  await tester.tap(find.byKey(const Key('text_button_login')));
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testing if we can make login', () {
    testWidgets('Login', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      sleepSec(1);

      await login(tester);

      sleepSec(2);

      expect(find.byType(HomeScreen), findsOneWidget);

      sleepSec(2);

      await tester.pumpAndSettle();
      expect(find.byKey(const Key('AppBarHome')), findsOneWidget);
    });
  });

  group('Testing SignUpPage', () {
    testWidgets('Testing SignUp Page', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      sleepSec(1);

      await tester.tap(find.byKey(const Key('text_button_signup')));

      sleepSec(1);
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('textfield_email_signup')),
        'julia@julia',
      );
      await tester.enterText(
        find.byKey(const Key('textfield_password_signup')),
        'jujujuju',
      );

      await tester.enterText(
        find.byKey(const Key('textfield_confirm_password')),
        'jujujuju',
      );

      await tester.pump();
      sleepSec(1);

      await tester.testTextInput.receiveAction(TextInputAction.done);
      //It's closing the cellphone's keyboard
      await tester.pumpAndSettle();
      sleepSec(2);

      await tester.tap(find.byKey(const Key('button_signup_signup')));

      await tester.pumpAndSettle();
      sleepSec(1);
    });
  });

  group('Testing adding a new idea', () {
    testWidgets('Testing a new ideia', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await login(tester);

      sleepSec(2);
      await tester.tap(find.byKey(const Key('addButton')));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('newIdeaField')),
        'I have an idea',
      );

      sleepSec(1);
      await tester.pump();

      await tester.enterText(
        find.byKey(const Key('inspirationField')),
        'this is my idea :)',
      );

      sleepSec(2);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.pump();

      await tester.tap(find.byKey(const Key('addIdeaButton')));
      await tester.pumpAndSettle();
      sleepSec(2);
    });
  });
}
