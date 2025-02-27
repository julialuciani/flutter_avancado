import 'package:flutter/material.dart';
import 'package:flutter_avancado/pointers_practice_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gesture Recognition',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const PointersPracticePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pointers',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Listener(
              child: Container(
                height: 200,
                width: 200,
                color: const Color.fromRGBO(253, 27, 91, 1),
              ),
              onPointerDown: (event) => print('Down $event'),
              onPointerUp: (event) => print('Up $event'),
              onPointerMove: (event) => print('Move $event'),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onDoubleTap: () {
                print('Fui clicado 2 vezes');
              },
              onLongPress: () {
                print('Me solta');
              },
              onTap: () {
                print('Fui Clicado');
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
