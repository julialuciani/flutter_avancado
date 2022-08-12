import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'card_movie.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Visibility(
        visible: movies.isNotEmpty,
        replacement: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
                    height: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // physics: const NeverScrollableScrollPhysics(),
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   childAspectRatio: 0.5,
          // ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            MovieEntity movie = movies[index];
            double rating = movie.voteAverage / 10;
            double ratingNumber = movie.voteAverage * 10;
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: CardMovie(movie: movie, ratingNumber: ratingNumber, rating: rating),
              ),
            );
          },
        ),
      ),
    );
  }
}
