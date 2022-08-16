import 'package:core/core.dart';
import 'package:design_system/widgets/button_default_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Essa é a home'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            ButtonDefaultWidget(
              title: 'See our products',
              onPressed: () => navigatorKey.currentState?.pushNamed('/products'),
            ),
          ],
        ),
      ),
    );
  }
}
