import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'widgets/body_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Hero Radial'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: const BodyHome(),
    );
  }
}

