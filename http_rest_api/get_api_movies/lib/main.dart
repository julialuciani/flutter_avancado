import 'package:flutter/material.dart';
import 'package:get_api_movies/core/app_routes.dart';
import 'package:get_api_movies/presenter/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: appRoutes,
      onUnknownRoute: onUnknownRoute,
    );
  }
}
