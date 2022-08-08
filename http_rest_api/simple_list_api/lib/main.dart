import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_list_api/presenter/home_page.dart';

import 'core/app_routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
