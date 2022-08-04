import 'package:flutter/material.dart';
import 'package:simple_list_api/presenter/animes_page.dart';
import 'package:simple_list_api/presenter/posts_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple get lists',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(width: 2, color: Colors.pink.shade50),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(PostsPage.route);
              },
              color: Colors.pink.shade100,
              child: const Text(
                'Get posts',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(width: 2, color: Colors.pink.shade50),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AnimesPage.route);
              },
              color: Colors.pink.shade100,
              child: const Text(
                'Get animes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
