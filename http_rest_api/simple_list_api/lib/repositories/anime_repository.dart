import 'package:dio/dio.dart';

import '../models/anime_model.dart';

class AnimesRepository {
  final Dio dio;

  AnimesRepository(this.dio);

  Future<List<AnimeModel>> getAllAnimes() async {
    List<AnimeModel> animes = [];
    try {
      final response =
          await dio.get('https://anime-facts-rest-api.herokuapp.com/api/v1');

      animes = List.from(
        response.data['data'].map(
          (anime) {
            return AnimeModel.fromMap(anime);
          },
        ),
      );
    } catch (e) {
      print('Deu erro $e');
    }

    return animes;
  }
}
