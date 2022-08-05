
import 'package:flutter/material.dart';
import 'package:get_api_movies/presenter/home_page.dart';
import 'package:get_api_movies/presenter/movies_page.dart';

var appRoutes = {
MoviesPage.route: (context) => const MoviesPage(),
HomePage.route: (context) => const HomePage(),
};

var onUnknownRoute = (context){
return MaterialPageRoute(builder: (context){
  return const Text('Page Not Found');
});
};