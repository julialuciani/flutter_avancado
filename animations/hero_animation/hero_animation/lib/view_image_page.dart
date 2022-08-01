import 'package:flutter/material.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: 'imagem',
          child: GestureDetector(
            onTapDown: (event){
              Navigator.pop(context);
            },
            child: Image.network(
              'https://cdn.pixabay.com/photo/2019/04/21/14/39/meerkat-4144260_960_720.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
