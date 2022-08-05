import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minhas_encomendas/models/evento_model.dart';
import 'package:minhas_encomendas/repositories/encomenda_repository.dart';

class EconmendaPage extends StatefulWidget {
  const EconmendaPage({Key? key}) : super(key: key);

  @override
  State<EconmendaPage> createState() => _EconmendaPageState();
}

class _EconmendaPageState extends State<EconmendaPage> {
  final _repository = EncomendaRepository(Dio());
  late Future<List<EventoModel>> events;

  @override
  void initState() {
    events = _repository.getEventsByCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreamento de encomendas'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
