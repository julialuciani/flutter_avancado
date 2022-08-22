import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          'Note.it',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Write about what inspires you...',
              style: TextStyle(letterSpacing: 3, color: Colors.grey.shade400, fontSize: 18),
              key: const Key('inspirational_text'),
              semanticsLabel: 'Write about what inspires you',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-note');
        },
        backgroundColor: Colors.pink.shade100,
        key: const Key('floating_action_button_home'),
        tooltip: 'Button to add a new note',
        child: const Icon(Icons.add),
      ),
    );
  }
}