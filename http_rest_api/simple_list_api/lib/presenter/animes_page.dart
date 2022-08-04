import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_list_api/repositories/anime_repository.dart';

import '../models/anime_model.dart';

class AnimesPage extends StatefulWidget {
  static const route = '/animes-page';
  const AnimesPage({Key? key}) : super(key: key);

  @override
  State<AnimesPage> createState() => _AnimesPageState();
}

class _AnimesPageState extends State<AnimesPage> {
  AnimesRepository repository = AnimesRepository(Dio());
  late Future<List<AnimeModel>> animes;

  @override
  void initState() {
    animes = repository.getAllAnimes();
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
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          'Animes',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: animes,
            builder: (context, AsyncSnapshot<List<AnimeModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    AnimeModel anime = snapshot.data![index];
                    return Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                anime.animeName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Image.network(
                                anime.animeImage,
                                width: MediaQuery.of(context).size.width * 0.5,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    'https://i0.wp.com/otageek.com.br/wp-content/uploads/2020/12/Jujutsu-Kainsen-Otageek-Crunchyroll.jpg?w=640&ssl=1',
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                  );
                                },
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
