import 'package:flutter/material.dart';
import 'page_two.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Navigation',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/page-two': (context) => const PageTwo(
            title: 'Página dois',
          ),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/page-two',
                arguments: {
                  'name' : 'Júlia',
                  'idade' : 17,
                  'lista' : ['Meu', 'nome', 'é', 'júlia','Meu', 'nome', 'é', 'júlia']
                },
                
              );
            },
            child: const Text('Página 2'),
          ),
        ),
      ),
    );
  }
}
