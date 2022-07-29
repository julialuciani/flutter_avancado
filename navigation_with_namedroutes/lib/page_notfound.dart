import 'package:flutter/material.dart';

class PageNotfound extends StatelessWidget {
  static const route = '/page-not-found';

  const PageNotfound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_emotions,
                color: Colors.pink,
                size: 100,
              ),
              const SizedBox(height: 20,),
              const Text('Página não encontrada'),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ));
  }
}
