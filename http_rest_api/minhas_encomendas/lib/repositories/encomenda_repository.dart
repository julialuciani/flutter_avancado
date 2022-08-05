
import 'package:dio/dio.dart';

import '../models/evento_model.dart';

class EncomendaRepository {
  final Dio dio;

  EncomendaRepository(this.dio);

  Future<List<EventoModel>> getEventsByCode() async {
    List<EventoModel> events = [];

    var data = {
      'code': 'ON931559908BR',
      'type': 'LS',
    };

    final response = await dio.post(
      'https://correios.contrateumdev.com.br/api/rastreio',
      data: data,
    );
    print(response.data);

    events = List.from(
      response.data['objeto'][0]['evento'].map((evento) {
        return EventoModel.fromMap(evento);
      }),
    );
    print(events);
    return(events);
  }
}
