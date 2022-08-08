import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final storage = LocalStorage('data.json');

  saveInfoStorage() async {
    await storage.setItem('title', textController.text);
    textController.clear();
    setState(() {});
  }

  removeInfoStorage() async {
    await storage.deleteItem('title');
    setState(() {});
  }

  String getInfoStorage() {
    return storage.getItem('title') ?? 'não tem nada aqui';
  }

  clearStorage() async {
    await storage.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                alignLabelWithHint: true,
                hintText: 'Escreva algo',
                labelText: 'algo',
                labelStyle: const TextStyle(letterSpacing: 3),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            FutureBuilder(
              future: storage.ready,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Text(getInfoStorage());
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.indigo.shade300,
            onPressed: () {
              saveInfoStorage();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.indigo.shade300,
            onPressed: () {
              removeInfoStorage();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
