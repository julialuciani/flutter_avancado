import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _prefs = SharedPreferences.getInstance();
  final titleController = TextEditingController();

  saveInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.setString('title', titleController.text);
    titleController.clear();
    setState(() {});
  }

  removeInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.remove('title');
    setState(() {});
  }

  removeAllInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.clear();
    setState(() {});
  }

  Future<String> getInfoStorage() async {
    return _prefs.then((prefs) => prefs.getString('title') ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        title: const Text(
          'Shared Preferences',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Note',
                hintText: 'Write something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Your Notes',
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 25,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
            future: getInfoStorage(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
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
            child: const Icon(Icons.done_all_outlined),
          ),
          FloatingActionButton(
            backgroundColor: Colors.indigo.shade300,
            onPressed: () {
              removeInfoStorage();
            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
