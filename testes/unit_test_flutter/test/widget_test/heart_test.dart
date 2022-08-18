import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/home_page.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  testWidgets('Testing the heart animation', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const HomePage()));

    final Finder iconFinder = find.byKey(const Key('IconHeart'));

    expect(iconFinder, findsOneWidget); //FindsWidgets

    final Icon icon = tester.widget(iconFinder);

    expect(icon.color, Colors.pink.shade300);

    expect(icon.size, 100);

    expect(icon.icon, Icons.favorite_border);

    final tapFinder = find.byKey(const Key('ButtonHeart'));

    await tester.tap(tapFinder);

    await tester.pumpAndSettle();

    final Icon iconAfter = tester.widget(iconFinder);

    expect(iconAfter.size, 200);

    expect(iconAfter.color, Colors.pink);

    expect(iconAfter.icon, Icons.favorite);
  });
}
