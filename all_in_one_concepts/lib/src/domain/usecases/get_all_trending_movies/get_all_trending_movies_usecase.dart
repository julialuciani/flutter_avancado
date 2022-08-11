

import '../../entities/movie_entity.dart';

abstract class IGetAllTrendingMoviesUsecase {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow);
}