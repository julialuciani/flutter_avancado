   import 'package:flutter/material.dart';

import '../../src/domain/entities/movie_entity.dart';

getColorByMovieRating(MovieEntity movie) {
      if (movie.voteAverage <= 7) {
        return Colors.yellow;
      }
      return Colors.greenAccent;
    }