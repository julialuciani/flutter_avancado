import 'package:all_in_one_concepts/src/presenter/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() {
  initializeDateFormatting('pt_BR');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: Colors.blue.shade900
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
