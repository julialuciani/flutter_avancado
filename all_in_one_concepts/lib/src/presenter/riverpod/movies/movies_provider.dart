import 'package:all_in_one_concepts/src/domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase_imp.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'movies_notifier.dart';

final dioProvider = Provider(((ref) => Dio()));

final moviesUseCaseProvider = Provider((ref) => GetAllTrendingMoviesUsecaseImp(_repository));

final MoviesNofierProvider = StateNotifierProvider(
  (ref) => MoviesNotifier(ref.watch(moviesUseCaseProvider)),
);
