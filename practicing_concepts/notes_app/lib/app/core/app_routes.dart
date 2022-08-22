
import 'package:flutter/material.dart';
import 'package:notes_app/app/presenter/ui/add_new_note_page.dart';
import 'package:notes_app/app/presenter/ui/auth/login_page.dart';
import 'package:notes_app/app/presenter/ui/page_not_found.dart';

import '../presenter/ui/home_page.dart';

var appRoutes = {
  HomePage.route: (context) => const HomePage(),
  AddNewIdeaPage.route: (context) => AddNewIdeaPage(),
  LoginPage.route: (context) => const LoginPage(),
};

var onUnknownRoute = (context) {
  return MaterialPageRoute(
    builder: (context) {
      return const PageNotFound();
    },
  );
};