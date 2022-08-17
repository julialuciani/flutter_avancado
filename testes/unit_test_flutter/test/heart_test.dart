import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  IconData icon = Icons.favorite_border;
  double size = 100;
  Color color = Colors.pink.shade300;

  changeIcon() {
    if (icon == Icons.favorite_border) {
      icon = Icons.favorite;
      size = 200;
      color = Colors.pink;
    } else {
      icon = Icons.favorite_border;
      size = 100;
      color = Colors.pink.shade300;
      
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          changeIcon();
        },
        child: Icon(icon, size: size, color: color,),
      ),
    );
  }
}


Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main(){

  testWidgets('Testing the heart animation', (WidgetTester tester) async{

    await tester.pumpWidget(makeTestable(const Heart()));

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsOneWidget);

    final Icon icon = tester.widget(iconFinder);

    expect(icon.color, Colors.pink.shade300);

    expect(icon.size, 100);

    expect(icon.icon, Icons.favorite_border);

    final tapFinder = find.byType(GestureDetector);

    await tester.tap(tapFinder);

    await tester.pumpAndSettle();

    final Icon iconAfter = tester.widget(iconFinder);

    expect(iconAfter.size, 200);

    expect(iconAfter.color, Colors.pink);

    expect(iconAfter.icon, Icons.favorite);

  });
}