import 'package:flutter/material.dart';
import 'package:notes_app/app/presenter/add_new_note_page.dart';

import '../app/presenter/home_page.dart';
import '../app/presenter/page_not_found.dart';

var appRoutes = {
HomePage.route: (context) => const HomePage(),
AddNewIdeaPage.route: (context) => AddNewIdeaPage(),
};

var onUnknownRoute = (context){
  return MaterialPageRoute(builder:(context) {
    return const PageNotFound();
  },);
};