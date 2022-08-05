import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minhas_encomendas/repositories/feedback_repository.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _repository = FeedbackRepository(Dio());
  late Future<bool> sucess;

  @override
  void initState() {
    sucess = _repository.postFeedbacks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esse é o feedback'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: sucess,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData == true) {
              return const Text('Seu post dos feedbacks deu certo');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
