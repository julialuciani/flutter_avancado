import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page_repository.dart';

class HomePageCounter extends StatefulWidget {
  const HomePageCounter({Key? key}) : super(key: key);

  @override
  State<HomePageCounter> createState() => _HomePageCounterState();
}

class _HomePageCounterState extends State<HomePageCounter> {
  final _repository = HomeRepository();
  final StreamController<List<String>> streamController = StreamController();

  late Future<List<String>> names;

  @override
  void initState() {
    // names = _repository.getAllNames();
    getAllNamesFromStream();
    super.initState();
  }

  void getAllNamesFromStream() async {
    List<String> names = await _repository.getAllNames();
    streamController.add(names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FutureBuilder and StreamBuilder',
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _repository.timedCounter(const Duration(seconds: 2), 11),
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text(
                  "${snapshot.data}",
                  style: TextStyle(fontSize: 40, color: Colors.indigo.shade400, fontWeight: FontWeight.bold),
                ));
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
