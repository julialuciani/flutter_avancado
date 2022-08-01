import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  
  void changeClicked() {
    isClicked = !isClicked;
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
            Container(
              height: isClicked? 400 : 75,
              width: isClicked? 400 : 75,
              color: Colors.pink,
            ),
            ElevatedButton(
              onPressed: () {
                changeClicked();
              },
              child: const Text('Change Size'),
            ),
          ],
        ),
      ),
    );
  }
}
