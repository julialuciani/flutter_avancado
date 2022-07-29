import 'package:flutter/material.dart';

import 'page_two.dart';

void main(){
  runApp(MaterialApp(
    title:  'Simple Navigation',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage  extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PageTwo()),
              );
            },
            child: const Text('Página 2'),
          ),
        ),
      ),
    );
  }
}