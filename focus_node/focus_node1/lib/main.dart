import 'package:flutter/material.dart';
import 'package:focus_node1/core/app_routes.dart';
import 'package:focus_node1/practice_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Node',
      routes: appRoutes, //Isso faz com que o material saiba que tem rotas
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
     initialRoute: PracticePage.route, //Essa vai ser a rota inicial
    );
  }
}


