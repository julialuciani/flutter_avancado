import 'package:flutter/material.dart';
import 'package:navigation_with_namedroutes/page_three.dart';

class PageTwo extends StatelessWidget {

  static const route = '/page-two';


  const PageTwo({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataPageInitial = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 56,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: dataPageInitial['lista'].length,
            itemBuilder: ((context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    dataPageInitial['lista'][index],
                  ),
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
            ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushNamed( PageThree.route);
          },
          child: const Text('Go to page 3'),
        ),
          ],
        ),
      ),
    );
  }
}
