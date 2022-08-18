// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    //É tipo o runApp que fica dentro de lib
    await tester.pumpWidget(const MyApp());

    // expect sempre será usado para testar se algo está vindo no valor que deveria vir.
    //FIND é do tipo finder, ele é usado para encontrar Widgets através de propriedades
    //FINDSONEWIDGET é um mather, ele é usado para testar se foi encontrado somento 1 widget
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    //TESTER é usado para muitas coisas, como clicar em botão, inserir textos,
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica se o contador é verificado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

  });

  testWidgets('Text pushed button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('PushText')), findsOneWidget);
  });

  
    
}