import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nameUser = Provider((ref) => 'Júlia'); //Providers são criados fora da classe
final countProvider = StateProvider((ref) => 0);
final counterUpProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameUserWatch = ref.watch(nameUser);
    final counter = ref.watch(countProvider.state);
    final counterUp = ref.watch(counterUpProvider);

//Alguns providers precisam do .state pois mudam de estado
//Para chamá-los dentro da classe é preciso criar uma variável com NOME DIFERENTE
//Dê um hot restart se a tela ficar vermelha

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier - Riverpod'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oii :) $nameUserWatch',
              style: const TextStyle(fontSize: 30),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              counterUp.toString(),
              ),

                // counter.state.toString()), //Na view é preciso adicionar o state
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterUpProvider.notifier).increment();
          // counter.state++; //Adicionando o state++
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}
