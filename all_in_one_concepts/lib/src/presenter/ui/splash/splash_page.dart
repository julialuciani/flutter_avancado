import 'package:flutter/material.dart';

import '../movies/movies_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   @override
   void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return const MoviesPage();
      }));
    });
     super.initState();
     
   }

   @override
  Widget build(BuildContext context) {
       return Scaffold(
           body: Container(
            color: Colors.pink.shade200,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/video_tape.png', scale: 2,),
           ),
       );
  }
}