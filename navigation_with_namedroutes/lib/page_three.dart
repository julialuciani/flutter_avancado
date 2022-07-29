import 'package:flutter/material.dart';
import 'package:navigation_with_namedroutes/page_two.dart';

class PageThree extends StatelessWidget {

  static const route = '/page-three';


  const PageThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
       title: const Text('Página 3'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushNamed(PageTwo.route,
            arguments: {
                  'name': 'Júlia',
                  'idade': 17,
                  'lista': [
                    'Meu',
                    'nome',
                    'é',
                    'júlia',
                    'Meu',
                    'nome',
                    'é',
                    'júlia'
                  ]
                },);
          },
          child: const Text('Go to page 2'),
        ),
      ),
    );
  }
}
