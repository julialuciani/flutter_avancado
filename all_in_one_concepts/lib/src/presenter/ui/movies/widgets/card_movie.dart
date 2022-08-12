import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/format_date.dart';
import '../../../../../shared/utils/get_color_by_rating.dart';
import '../../../../domain/entities/movie_entity.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
    required this.ratingNumber,
    required this.rating,
  }) : super(key: key);

  final MovieEntity movie;
  final double ratingNumber;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 15,
                  top: 10,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.grey.shade600,
                    ),
                  )),
              Positioned(
                  left: 15,
                  bottom: 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                          child: CircleAvatar(
                        backgroundColor: Colors.grey.shade900,
                        radius: 22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ratingNumber.toStringAsFixed(0)),
                            const Text(
                              '%',
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      )),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0.0,
                          end: rating,
                        ),
                        duration: const Duration(seconds: 5),
                        builder: (context, value, child) {
                          return CircularProgressIndicator(
                            strokeWidth: 4,
                            backgroundColor: Colors.grey.shade800,
                            valueColor: AlwaysStoppedAnimation(
                              getColorByMovieRating(movie),
                            ),
                            value: value,
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  formatDate(movie.releaseDate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
