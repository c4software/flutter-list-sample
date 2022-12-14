import 'package:flutter/material.dart';
import 'package:hello_world/style/theme.dart';
import 'package:hello_world/ui/screens/home/HomePageTabs.dart';

void main() {
  runApp(const MyApp());
}

// Base de l'application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo + API',
      theme: myTheme,
      home: const HomePageScreen(),
    );
  }
}
