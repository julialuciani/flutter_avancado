import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/video_tape.png',),
        automaticallyImplyLeading: false,
        title: const Text(
          'Movies',
          style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade200,
      ),
      body: Container(),
    );
  }
}
