

import 'package:flutter/material.dart';
import 'package:simple_list_api/presenter/animes_page.dart';
import 'package:simple_list_api/presenter/home_page.dart';
import 'package:simple_list_api/presenter/posts_page.dart';

var appRoutes  = {
PostsPage.route: (context) => const PostsPage(),
AnimesPage.route: (context) => const AnimesPage(),
HomePage.route: (context) => const HomePage(),
};

var onUnknownRoute = (context){
  return MaterialPageRoute(builder: (contex){
    return const Text('Page not found');
  });
};