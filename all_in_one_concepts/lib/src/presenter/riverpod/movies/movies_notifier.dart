import 'package:all_in_one_concepts/src/domain/entities/movie_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>>{
  final IGetAllTrendingMoviesUsecase _usecase;
  MoviesNotifier(this._usecase) : super([]){
    getAllTrendingMovies('day');
  }

  Future<void> getAllTrendingMovies(String timeWindow) async {
    state = [];
    state = await _usecase.getAllTrendingMovies(timeWindow);
  }
}
