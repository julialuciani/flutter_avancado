import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final String title;

  const PageTwo({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataPageInitial = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: dataPageInitial['lista'].length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  dataPageInitial['lista'][index],
                ),
              );
            }),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataPageInitial['name']),
            Text(dataPageInitial['idade'].toString()),
          ],
        ),
      ),
    );
  }
}
