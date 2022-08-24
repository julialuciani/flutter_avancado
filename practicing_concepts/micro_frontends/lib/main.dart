import 'package:add_note/app/add_note_resolver.dart';
import 'package:core/app/base_app.dart';
import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core.dart';
import 'package:flutter/material.dart';
import 'package:home/app/micro_app_home_resolver.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login/app/micro_app_login_resolver.dart';
import 'package:sign_up/app/microapp_signup_resolver.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget with BaseApp{
MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    super.registerRoutes();

    return MaterialApp(
      title: 'App Notes in MicroFrontEnds',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
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
    MicroAppAddNoteResolver(),
    MicroappSignupResolver(),
  ];
}

