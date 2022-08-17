import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  IconData icon = Icons.favorite_border;
  double size = 100;
  Color color = Colors.pink.shade300;

  changeIcon() {
    if (icon == Icons.favorite_border) {
      icon = Icons.favorite;
      size = 200;
      color = Colors.pink;
    } else {
      icon = Icons.favorite_border;
      size = 100;
      color = Colors.pink.shade300;
      
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeIcon();
      },
      child: Icon(icon, size: size, color: color,),
    );
  }
}
