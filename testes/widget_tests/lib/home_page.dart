import 'package:flutter/material.dart';
import 'package:widget_tests/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage',
          key: Key('AppBarTitle'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                debugPrint('InkWell is pressed');
              },
              key: const Key('InkWell'),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.cyan,
                key: const Key('ContainerCyano'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Elevated button is pressed');
              },
              key: const Key('ElevatedButton'),
              child: const Text('Hello'),
            ),
            MaterialButton(
              onPressed: () {
                debugPrint('MaterialButton is Pressed');
              },
              color: Colors.purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              key: const Key('MaterialButton'),
              child: const Text(
                'Testing',
                style: TextStyle(color: Colors.white, letterSpacing: 3),
              ),
            ),
            TextButton(
              onPressed: () {
                debugPrint('TextButton is pressed');
              },
              key: const Key('TextButton'),
              child: const Text('Widgets'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondPage()));
        },
        key: const Key('button_next_page'),
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
