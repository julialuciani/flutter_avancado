import 'package:flutter/material.dart';
import 'package:minhas_encomendas/presenter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.pink,
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      
       );
  }
}