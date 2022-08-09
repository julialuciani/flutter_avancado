import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page_repository.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
      body: Center(
        child: StreamBuilder(
          stream: streamController.stream,
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
               return Text(snapshot.data![0]);
              // return ListView.builder(
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: (context, index) {
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(snapshot.data![index]),
              //       ],
              //     );
              //   },
              // );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
