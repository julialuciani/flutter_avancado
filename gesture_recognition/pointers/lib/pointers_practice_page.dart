import 'package:flutter/material.dart';

class PointersPracticePage extends StatefulWidget {
  const PointersPracticePage({Key? key}) : super(key: key);

  @override
  State<PointersPracticePage> createState() => _PointersPracticePageState();
}

class _PointersPracticePageState extends State<PointersPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pointers Practice',
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clique nos círculos e veja algo acontecer'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            GestureDetector(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onDoubleTap: () => print('onDoubleTap'),
              onDoubleTapCancel: () => print('OnDoubleTapCancel'),
              onDoubleTapDown: (details) => print('onDoubleTapDown'),
              onForcePressEnd: (details) => print('onForcePressEnd'),
              onHorizontalDragDown: (details) => print('onHorizontalDragDown'),
              onLongPress: () => print('OnLongPress'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Listener(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPointerCancel: (event) => print("OnPointerCancel $event"),
              onPointerHover: (event) => print('OnPointerHover $event'),
              onPointerDown: (event) => print('OnPointerDown $event'),
              onPointerMove: (event) => print('OnPointerMove $event'),
              onPointerSignal: (event) => print('OnPointSignal $event'),
              onPointerUp: (event) => print('OnPointerUp $event'),
            ),
          ],
        ),
      ),
    );
  }
}
