import 'package:flutter/material.dart';
import 'package:unit_test_flutter/heart.dart';
import 'package:unit_test_flutter/image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Testing',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Heart(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ImagePage(),
            ),
          );
        },
        child: const Icon(
          Icons.change_circle,
          size: 30,
        ),
      ),
    );
  }
}
