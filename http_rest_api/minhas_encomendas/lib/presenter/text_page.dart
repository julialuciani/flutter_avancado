import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minhas_encomendas/repositories/text_repository.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final _repository = TextRepository(Dio());
  late Future<bool> sucess;

  @override
  void initState() {
    sucess = _repository.postTexts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Texts'),
        centerTitle: true,
      ),
      body: Center(
        child: (FutureBuilder(
          future: sucess,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData == true) {
              return const Text('Tudo certo');
            }
            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
