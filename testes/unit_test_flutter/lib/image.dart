import 'dart:math';

import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List<String> words = ['Júlia', 'Guilherme', 'Janaina', 'Pedro'];

  List<String> imagePaths = [
    'assets/images/gato_boca.jpg',
    'assets/images/gato_calcinha.jpg',
    'assets/images/gato_zoiudo.jpg',
  ];

  String image = 'assets/images/gato_boca.jpg';

  void changeImage() {
    int randomImage = Random().nextInt(imagePaths.length);
    while (image == imagePaths[randomImage]){
      randomImage = Random().nextInt(imagePaths.length);
    }

    setState(() {
      image = imagePaths[randomImage];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Images',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(words[0]),
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.5,
              
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Colors.indigo,
              onPressed: () {
                changeImage();
              },
              child: const Text(
                'Change',
                style: TextStyle(color: Colors.white, letterSpacing: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
