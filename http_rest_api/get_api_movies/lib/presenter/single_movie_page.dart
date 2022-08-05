import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class SingleMoviePage extends StatelessWidget {
  static const route = '/single-movie-page';
  SingleMoviePage({Key? key, required this.movie}) : super(key: key);

  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.heart_broken,
              size: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.pink.shade100,
          // title: Text(
          //   // movie.title,
          //   style: const TextStyle(color: Colors.white),
          // ),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              child: Column(children: [
                Text(
                  movie.title,
                  style: const TextStyle(fontSize: 25, letterSpacing: 5),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  movie.originalTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    movie.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Image.network(
                  movie.image,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ]),
            ),
          ),
        ));
  }
}
