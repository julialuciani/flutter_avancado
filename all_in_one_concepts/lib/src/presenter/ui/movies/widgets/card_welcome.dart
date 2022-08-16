import 'package:flutter/material.dart';

class CardWelcome extends StatelessWidget {
  const CardWelcome({
    Key? key,
    required this.controllerSerch,
  }) : super(key: key);

  final TextEditingController controllerSerch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue.shade900,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      scale: 5,
                    ),
                  ],
                ),
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.alternate_email,
                    size: 12,
                  ),
                ),
                const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  'Filmes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Séries',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Pessoas',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Mais',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                controller: controllerSerch,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search for Movie...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}