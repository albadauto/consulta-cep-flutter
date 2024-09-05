import 'package:consultagov/src/pages/endereco_page.dart';
import 'package:consultagov/src/pages/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      routes: {
        '/': (context) => MainPage(),

      },
    );
  }
}
