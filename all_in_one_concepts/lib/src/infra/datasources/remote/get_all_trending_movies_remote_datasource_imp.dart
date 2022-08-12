import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../dtos/movie_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp implements IGetAllTrendingMoviesDatasource {
  final Dio _dio;
  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    List<MovieEntity> movies = [];

    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/trending/movie/$timeWindow',
        queryParameters: {
          'api_key': 'f62bcc0493d7210741ed4fea17985839',
        },
      );

      movies = List.from(
        response.data['results'].map(
          (movie) => MovieDto.fromMap(movie),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return movies;
  }
}
