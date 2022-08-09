import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            'https://img.freepik.com/fotos-gratis/lindo-casal-de-velhos-passou-algum-tempo-juntos-em-um-parque_1157-33094.jpg?w=2000',
            semanticLabel: 'Casal de idosos felizes e se abraçando',
          ),
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {},
            tooltip: 'Botão de salvar',
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {},
            
          ),
          Semantics(
            hint: 'Botão não salvar',
            child: InkWell(
              excludeFromSemantics: true, //pra ele ignorar esse 
              child: const Text("Don't Save"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
