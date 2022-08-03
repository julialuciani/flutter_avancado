import 'package:flutter/material.dart';
import 'package:simple_rest_api/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Api Rest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: false),
      darkTheme: ThemeData(
        brightness: Brightness.light
      ),
      home: const HomePage(),
    );
  }
}
