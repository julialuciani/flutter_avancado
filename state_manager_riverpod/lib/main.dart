import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(title: 'Fruits State'),
      ),
    ),
  );
}

final countProvider = StateProvider<int>((ref) => 0);
final nameUserProvider = Provider<String>((ref) => 'Júlia');

class HomePage extends HookConsumerWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(countProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   ref.watch(nameUserProvider),
            // ),
            Text(
              counter.state.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              counter.state++;
            },
            child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    
      
    );
  }
}
