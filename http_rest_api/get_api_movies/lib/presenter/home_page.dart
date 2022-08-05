import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_api_movies/presenter/movies_page.dart';
import 'package:get_api_movies/presenter/single_movie_page.dart';
import 'package:get_api_movies/repositories/movie_repository.dart';

import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
   static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
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
            Navigator.of(context).pushNamed(MoviesPage.route);
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
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  MovieModel movie = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleMoviePage(
                                movie: movie,
                              )));
                    },
                    child: Image.network(
                      movie.image,
                      width: MediaQuery.of(context).size.height * 0.5,
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
