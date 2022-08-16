import 'package:core/app/base_app.dart';
import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/microapp.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home_resolver.dart';
import 'package:micro_app_login/app/micro_app_login_resolver.dart';
import 'package:micro_app_login/app/pages/login_page.dart';
import 'package:micro_app_products/app/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();
    eventBus.on().listen((event){
      print(event);
    });

    return MaterialApp(
      title: 'Micro Frontends',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: false),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: super.generateRoutes,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppHomeResolver(),
        MicroAppLoginResolver(),
        MicroProductsResolver(),
      ];
}
