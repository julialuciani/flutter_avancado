import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode focusNome = FocusNode();
  FocusNode focusCpf = FocusNode();
  
  bool isClicked = false;
  bool parar = false;
  double randomNumber = Random().nextDouble() * 300;

  void changeClicked() {
    isClicked = !isClicked;
    setState(() {
      randomNumber = Random().nextDouble() * 250;
    });
  }

  stop() {
    parar = !parar;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AnimatedRotation(
              duration: const Duration(microseconds: 1),
              turns: isClicked ? 100 : 0,
              child: AnimatedContainer(
                onEnd: () {
                  parar ? stop() : changeClicked();
                },
                height: isClicked ? randomNumber : 200,
                width: isClicked ? randomNumber : 100,
                decoration: BoxDecoration(
                  borderRadius: isClicked
                      ? BorderRadius.circular(randomNumber)
                      : BorderRadius.circular(25),
                  color: isClicked ? Colors.pink : Colors.purple,
                ),
                // curve: Curves.bounceIn,
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                clipBehavior:
                    isClicked ? Clip.antiAliasWithSaveLayer : Clip.none,
              ),
            ),
            const Spacer(),
            AnimatedRotation(
              duration: const Duration(microseconds: 1),
              turns: isClicked ? 100 : 0,
              child: AnimatedContainer(
                onEnd: () {
                  parar ? stop() : changeClicked();
                },
                height: isClicked ? randomNumber : 200,
                width: isClicked ? randomNumber : 100,
                decoration: BoxDecoration(
                  borderRadius: isClicked
                      ? BorderRadius.circular(randomNumber)
                      : BorderRadius.circular(25),
                  color: isClicked ? Colors.purple : Colors.pink,
                ),
                // curve: Curves.bounceIn,
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                clipBehavior:
                    isClicked ? Clip.antiAliasWithSaveLayer : Clip.none,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                changeClicked();
              },
              child: const Text('Fazer algo'),
            ),
            const Spacer(),
            AnimatedRotation(
              turns: 100.00,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                  onPressed: () {
                    stop();
                  },
                  child: const Text('Parar')),
            ),
          ],
        ),
      ),
    );
  }
}
