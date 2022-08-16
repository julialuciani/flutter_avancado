import 'package:core/app/micro_core_utils.dart';
import 'package:design_system/design_system.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ButtonDefaultWidget(
          title: 'Ir para a home',
          onPressed: () {
            navigatorKey.currentState?.pushNamed('/home');
            eventBus.fire("olá júlia");
          },
        ),
      ),
    );
  }
}
