import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/app_routes.dart';
import 'page_two.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Simple Navigation',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
        onUnknownRoute: onUnknownRoute,
      ),
    ),
  );
}

final nameProvider = StateProvider<String>((ref) => 'sem nome');

class MyHomePage extends HookConsumerWidget {
  static const route = '/';
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Meu nome é: ${name.state}'),
            
            const SizedBox(height: 20,),
            const nameButton('Júlia'),
            const nameButton('dddd'),
            const nameButton('fff'),
            const nameButton('hhhh'),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      PageTwo.route,
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
                      },
                    );
                  },
                  child: const Text('Página 2'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class nameButton extends HookConsumerWidget {
  final String name;

  const nameButton(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.watch(nameProvider.notifier).state = name;
      },
      child: Text(name),
    );
  }
}
