import 'package:flutter/material.dart';
import 'package:focus_node1/page_two.dart';

class HomePage extends StatelessWidget {

  static const route = '/';

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home'),
           centerTitle: true,
           ),
           body: Center(
            child: ElevatedButton(
              onPressed: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageTwo())
                // );
                Navigator.of(context).pushNamed(RegisterPage.route); //rota nomeadas
              }, child: const Text('Página dois'),
            ),
           ),
       );
  }
}