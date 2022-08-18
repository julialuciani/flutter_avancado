import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ideast/main.dart';
import 'package:ideast/screens/home_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void sleepSec(int seconds) => sleep(Duration(seconds: seconds));

  group('Testing if we can make login', () {
    testWidgets('Login', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      sleepSec(1);

      await tester.enterText(
        find.byKey(const Key('emailLoginField')),
        'julia@julia',
      );
      await tester.enterText(
        find.byKey(const Key('passwordLoginField')),
        'jujujuju',
      );

      sleepSec(1);

      await tester.tap(find.byKey(const Key('text_button_login')));
      await tester.pumpAndSettle();

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

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('textfield_email_signup')),
        'julia@julia',
      );
      await tester.enterText(
        find.byKey(const Key('textfield_password_signup')),
        'jujuju',
      );

      await tester.enterText(
        find.byKey(const Key('textfield_confirm_password')),
        'jujuju',
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);
      //It's closing the cellphone's keyboard

      sleepSec(1);

      await tester.tap(find.byKey(const Key('button_signup_signup')));

      await tester.pump();
      sleepSec(1);
    });
  });
}
