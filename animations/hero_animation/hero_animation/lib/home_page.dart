import 'package:flutter/material.dart';
import 'package:hero_animation/view_image_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ViewImagePage()));
          },
          child: Hero(
            tag: 'imagem',
            child: Image.network(
              'https://cdn.pixabay.com/photo/2019/04/21/14/39/meerkat-4144260_960_720.jpg',
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
