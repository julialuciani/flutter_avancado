import 'package:flutter/material.dart';
import 'package:project_sqflite/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  Future<String> getText() async {
    return dbHelper.getText();
  }

  Future saveText() async {
    if (textController.text.isNotEmpty) {
      var response = await dbHelper.insertText(textController.text);
      if (response == 0) {
        print('Deu erro ao salvar');
      } else {
        print('Deu certo ao salvar');
      }
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sqflite',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: 'Digite seu texto...',
                  labelText: 'Texto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            FutureBuilder(
              future: getText(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
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
            onPressed: () async {
              await saveText();
            },
            child: const Icon(Icons.done_all_outlined),
          ),
          FloatingActionButton(
            backgroundColor: Colors.indigo.shade300,
            onPressed: () async {
              // await deleteText();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
