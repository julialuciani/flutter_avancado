import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_api_movies/repositories/movie_repository.dart';

import '../models/movie_model.dart';

class MoviesPage extends StatefulWidget {
  static const route = '/movies-page';
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MovieRepository repository = MovieRepository(Dio());
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    movies = repository.getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: movies,
            builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    MovieModel movie = snapshot.data![index];
                    return Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: const TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(movie.originalTitle),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        movie.description,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    movie.image,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Text(
                                    'by ${movie.director}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
