import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/movies/movies_provider.dart';
import 'card_welcome.dart';
import 'mostpopulartext.dart';
import 'movies_gridview.dart';

class BodyMoviesPage extends HookConsumerWidget {
  BodyMoviesPage({Key? key}) : super(key: key);

  final controllerSerch = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNofierProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          CardWelcome(controllerSerch: controllerSerch),
          MostPopularText(title: 'Os mais populares',),
          MoviesGridView(movies: movies),
          MostPopularText(title: 'Grátis para assistir'),
          MoviesGridView(movies: movies),
        ],
      ),
    );
  }
}
