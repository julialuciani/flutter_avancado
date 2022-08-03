import 'package:flutter/material.dart';
import 'package:simple_rest_api/get_api_page.dart';
import 'package:simple_rest_api/post_api_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Api Rest',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(width: 1),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GetApiPage()));
              },
              child: const Text(
                'GET',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(width: 1),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PostApiPage()));
              },
              child: const Text(
                'POST',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(width: 1),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GetApiPage()));
              },
              child: const Text(
                'DELETE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
