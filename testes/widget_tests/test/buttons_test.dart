import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/home_page.dart';
import 'package:widget_tests/second_page.dart';

void main() {
  testWidgets('Verificar titulos', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    final Finder appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);
    final AppBar appBar = tester.widget(appBarFinder);
    tester.widget(find.byKey(const Key('AppBarTitle')));

    await tester.tap(find.byKey(const Key('ContainerCyano')));
    await tester.tap(find.text('Hello'));
    await tester.tap(find.text('Testing'));
    await tester.tap(find.text('Widgets'));
    await tester.tap(find.byKey(const Key('ElevatedButton')));
    await tester.tap(find.byKey(const Key('InkWell')));
    await tester.tap(find.byKey(const Key('TextButton')));
    await tester.tap(find.byKey(const Key('MaterialButton')));

    final Finder materialButtonFinder = find.byType(MaterialButton);
    expect(materialButtonFinder, findsOneWidget);
    final MaterialButton material = tester.widget(materialButtonFinder);
    expect(material.color, Colors.purple);

    await tester.pumpAndSettle();

    tester.printToConsole('Tapping the button that will go to the second page');
    await tester.tap(find.byKey(const Key('button_next_page')));

    tester.printToConsole('Waiting for flutter to renderize everything');
    await tester.pumpAndSettle();

    tester.printToConsole('Verifying if it cames to the second Page');
    expect(find.byType(SecondPage), findsOneWidget);
  });
}
