
import 'package:all_in_one_concepts/src/domain/entities/movie_entity.dart';

abstract class IGetAllTrendingMoviesDatasource {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow);
  
}