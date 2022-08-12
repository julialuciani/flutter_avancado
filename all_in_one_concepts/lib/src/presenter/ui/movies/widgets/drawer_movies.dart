import 'package:all_in_one_concepts/src/presenter/riverpod/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerMovies extends HookConsumerWidget {
  const DrawerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                image: DecorationImage(
                  image: Image.asset('assets/logo.png').image,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Daily Movies'),
            onTap: () {
              ref.read(moviesNofierProvider.notifier).getAllTrendingMovies('day');
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          Divider(
            height: 10,
            color: Colors.blue.shade900,
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Weekly Movies'),
            onTap: () {
              ref.read(moviesNofierProvider.notifier).getAllTrendingMovies('week');
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
