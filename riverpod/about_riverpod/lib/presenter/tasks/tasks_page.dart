import 'package:about_riverpod/presenter/tasks/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameUser = ref.watch(nameUserProvider);
    final nameState = ref.watch(nameStateProvider.state).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olá $nameState'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (nameState == 'Júlia'){
                ref.read(nameStateProvider.notifier).state = 'Guilherme';
            } else{
              ref.read(nameStateProvider.notifier).state = 'Júlia';
            }

            
          },
          child: const Icon(
            Icons.change_circle,
            size: 40,
          )),
    );
  }
}
